import argparse
import json
from collections import defaultdict


features_lookup = {
    "Parameterized class": "Parametric polymorphism",
    "Parameterized type": "Parametric polymorphism",
    "Parameterized function": "Parametric polymorphism",
    "Use-site variance": "Parametric polymorphism",
    "Bounded type parameter": "Parametric polymorphism",
    "Declaration-site variance": "Parametric polymorphism",
    "Inheritance": "OOP features",
    "Overriding": "OOP features",
    "Subtyping": "Type system-related features",
    "Primitive type": "Type system-related features",
    "Wildcard type": "Type system-related features",
    "Nothing": "Type system-related features",
    "Lambda": "Functional programming",
    "Function reference": "Functional programming",
    "SAM type": "Functional programming",
    "Function type": "Functional programming",
    "Conditionals": "Standard language features",
    "Array": "Standard language features",
    "Cast": "Standard language features",
    "Variable arguments": "Standard language features",
    "Type argument inference": "Type inference",
    "Variable type inference": "Type inference",
    "Parameter type inference": "Type inference",
    "Flow typing": "Type inference",
    "Return type inference": "Type inference",
    "Named arguments": "Other"
}


lang_lookup = {
    'Groovy': 'groovyc',
    'Kotlin': 'kotlinc',
    'Javac': 'javac',
    'total': 'Total'
}

rows_lookup = {
    'generator': 'Generator',
    'inference': 'TEM',
    'soundness': 'TOM',
    'inference/soundness': 'TEM & TOM',
    'Unexpected Compile-Time Error': 'UCTE',
    'Unexpected Runtime Behavior': 'URB',
    'crash': 'Crash'
}

def get_args():
    parser = argparse.ArgumentParser(
        description='Process bugs.json to answer RQs')
    parser.add_argument("input", help="JSON File with bugs.")
    parser.add_argument("rq", choices=['rq1', 'rq2', 'rq3'], help="Select RQ.")
    return parser.parse_args()


def print_stats(lang, stats):
    print(80*"=")
    total = sum(v for v in stats['status'].values())
    print(lang + ' (total:' + str(total) + ')')
    print(80*"-")
    for category, value in stats.items():
        value = {k if k else "None": v for k, v in value.items()}
        res = [k + " (" + str(v) + ")" for k,v in value.items()]
        print("{}: {}".format(category, ", ".join(res)))
        print(80*"=")

def print_chars(chars_view, title):
    print()
    print(80*"=")
    print(title)
    print(80*"-")
    for count, char in chars_view:
        print("{:<29}{:<5}{:<50}".format(
            char, count,
            features_lookup[char] if title == "Characteristics" else ""))
    print(80*"=")



def process(bug, res, chars, combinations, categories):
    d = {
        'status': {
            'Kotlin': {
                'Submitted': 'Reported',
                'In Progress': 'Confirmed',
                'Open': 'Confirmed',
                'Closed': None
            },
            'Groovy': {
                'Open': 'Confirmed',
                'In Progress': 'Confirmed',
                'Resolved': None,
                'Reopened': 'Confirmed',
                'Closed': None
            },
            'Java': {
                'New': 'Confirmed',
                'Closed': None,
                'Resolved': None,
                'Open': 'Confirmed'
            }
        },
        'resolution': {
            'Kotlin': {
                'Fixed': 'Fixed',
                'Obsolete': 'Fixed',
                'As Designed': 'Wont fix',
                'Duplicate': 'Duplicate'
            },
            'Groovy': {
                'Duplicate': 'Duplicate',
                'Fixed': 'Fixed',
                'Information Provided': 'Wont fix',
            },
            'Java': {
                'Not an Issue':  'Wont fix',
                'Duplicate': 'Duplicate',
                'Fixed': 'Fixed'
            }
        },
        'symptom': {
            'Unexpected Compile-Time Error': 'Unexpected Compile-Time Error',
            'Unexpected Runtime Behavior': 'Unexpected Runtime Behavior',
            'crash': 'crash',
            'Misleading Report': 'Unexpected Compile-Time Error'
        },
    }
    lang = bug['language']
    bstatus = bug['status']
    bresolution = bug['resolution']
    bsymptom = bug['symptom']
    bmutator = bug['mutator']
    status = d['status'][lang].get(bstatus, None)
    if status is None:
        status = d['resolution'][lang].get(bresolution, None)
    symptom = d['symptom'].get(bsymptom, None)
    res[lang]['status'][status] += 1
    res[lang]['symptom'][symptom] += 1
    res[lang]['mutator'][bmutator] += 1
    res['total']['status'][status] += 1
    res['total']['symptom'][symptom] += 1
    res['total']['mutator'][bmutator] += 1

    bcategories = set()
    for char in bug['chars']['characteristics']:
        bcategories.add(features_lookup[char])
        chars[char] += 1
        mcategories = set()
        for comb in bug['chars']['characteristics']:
            if char != comb:
                mcategories.add(features_lookup[comb])
        for cat in mcategories:
            combinations[char][cat] += 1
    for c in bcategories:
        categories[c] += 1


def print_table(title, column_name, res, extra_line=True, first_col=20):
    # res should be a dict of dict in the following format:
    # {"row name": {"column name": value, ...}, ...}
    def print_line(title, columns, values):
        row_format = f"{{:<{first_col}}}" + "{:<10}" * len(columns)
        print(row_format.format(
            title,
            *(values[column] for column in columns)
        ))
    if len(res.values()) == 0:
        return
    header = [column_name] + list(list(res.values())[0].keys())
    row_format = f"{{:<{first_col}}}" + "{:<10}" * (len(header) - 1)
    lenght = first_col + 10 * (len(header) - 1)
    print(title.center(lenght))
    print(lenght * "=")
    pretty_header = [lang_lookup.get(h, h) for h in header]
    print(row_format.format(*pretty_header))
    print(lenght * "-")
    for counter, item in enumerate(res.items()):
        row_name, values = item
        if extra_line and counter == len(res)-1:
            print(lenght * "-")
        print_line(rows_lookup.get(row_name, row_name), header[1:], values)
    print()


def main():
    args = get_args()
    with open(args.input, 'r') as f:
        data = json.load(f)
    chars = defaultdict(lambda: 0)
    combinations = defaultdict(lambda: defaultdict(lambda: 0))
    res = defaultdict(lambda: {
        'status': {
            'Reported': 0,
            'Confirmed': 0,
            'Fixed': 0,
            'Wont fix': 0,
            'Duplicate': 0
        },
        'symptom': {
            'Unexpected Compile-Time Error': 0,
            'Unexpected Runtime Behavior': 0,
            'crash': 0
        },
        'mutator': {
            'generator': 0,
            'inference': 0,
            'soundness': 0,
            'inference/soundness': 0
        }
    })
    categories = defaultdict(lambda: 0)
    for bug in data:
        process(bug, res, chars, combinations, categories)
    langs = ['Groovy', 'Kotlin', 'Java', 'total']

    def per_attribute(attrs, attr, total=True):
        r = {
            s: {lang: res[lang][attr][s]
                for lang in langs}
            for s in attrs
        }
        if total:
            r['Total'] = {lang: sum(res[lang][attr][s] for s in r) 
                          for lang in langs}
        return r

    if args.rq == 'rq1':
        status_cat = res['total']['status'].keys()
        print(status_cat)
        status = per_attribute(status_cat, 'status', total=True)
        print_table('Figure 7a', 'Status', status)

    if args.rq == 'rq2':
        symtoms_cat = res['total']['symptom'].keys()
        symptoms = per_attribute(symtoms_cat, 'symptom', total=False)
        print_table('Figure 7b', 'Symptoms', symptoms, extra_line=False)

    if args.rq == 'rq3':
        mutators_cat = res['total']['mutator'].keys()
        mutators = per_attribute(mutators_cat, 'mutator', total=False)
        print_table('Figure 7c', 'Component', mutators, extra_line=False)

    #total = None
    #for lang, values in res.items():
    #    if lang == "total":
    #        total = values
    #    else:
    #        print_stats(lang, values)
    #print_stats("total", total)

    #chars_view = [ (v,k) for k,v in chars.items() ]
    #chars_view.sort(reverse=True)
    #categories_view = [ (v,k) for k,v in categories.items() ]
    #categories_view.sort(reverse=True)
    #print_chars(chars_view, "Characteristics")
    #print_chars(categories_view, "Categories")
    #if args.latex:
    #    total = None
    #    for lang, values in res.items():
    #        if lang == "total":
    #            total = values
    #        else:
    #            print_latex_commands(lang, values, [], [])
    #    print_latex_commands("Total", total, chars_view, categories_view)

    #if args.combinations:
    #    for char, combs in combinations.items():
    #        for comb, value in combs.items():
    #            print("{:<29} {:<29} {:>5}".format(char, comb, value))

if __name__ == "__main__":
    main()
