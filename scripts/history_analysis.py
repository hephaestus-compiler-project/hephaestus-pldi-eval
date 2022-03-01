"""Get the history of reported bugs.
"""
from collections import defaultdict
import argparse
import json
import os

import seaborn as sns
import pandas as pd
import matplotlib.pylab as plt


def create_dict():
    return {"total": 0, "javac": 0, "groovyc": 0, "kotlinc": 0}


def get_args():
    parser = argparse.ArgumentParser(
        description='Get stats about fixes.')
    parser.add_argument("db", help="Database with history")
    parser.add_argument("figure", help="Path to save the figure")
    return parser.parse_args()


def main():
    args = get_args()
    # The format for db is {'bugs_id': {'buggy': ['version 1'], 'not_buggy': []}}
    with open(args.db) as f:
        db = json.load(f)
    all_versions = create_dict()
    only_master = create_dict()
    regressions = create_dict()
    fixed = create_dict()
    data = defaultdict(list)
    for bugid, values in db.items():
        if bugid.startswith('KT'):
            key = 'kotlinc'
        elif bugid.startswith('GR'):
            key = 'groovyc'
            values['not_buggy'] = [
                v for v in values['not_buggy']
                if not v.startswith('1') and not v.startswith('2')
            ]
            values['buggy'] = [
                v for v in values['buggy']
                if not v.startswith('1') and not v.startswith('2')
            ]
        else:
            key = 'javac'
        if len(values['not_buggy']) == 0:
            data[(key, 'All')].append(bugid)
            all_versions[key] += 1
            all_versions['total'] += 1
        elif len(values['buggy']) == 0:
            data[(key, 'master only')].append(bugid)
            only_master[key] += 1
            only_master['total'] += 1
        else:
            # Check if all values in not buggy are bigger than in version in buggy.
            check = all(all(version > v for v in values['buggy'])
                        for version in values['not_buggy'])
            buggy_len = len(values['buggy'])
            if buggy_len <= 3:
                k = '[1-3]'
            elif buggy_len <= 6:
                k = '[4-6]'
            elif buggy_len <= 9:
                k = '[7-9]'
            elif buggy_len <= 12:
                k = '[10-12]'
            else:
                k = '> 12'
            data[(key, k)].append(bugid)
            if not check:
                regressions[key] += 1
                regressions['total'] += 1
                #if len(values['buggy']) > 5:
                #    print(bugid)
                # Check if fixed and then again bug
            else:
                regressions[key] += 1
                regressions['total'] += 1

    for comp in ['groovyc', 'kotlinc', 'javac']:
        print(comp)
        print(f"All versions are buggy: {all_versions[comp]}")
        print(f"The error exist only in master: {only_master[comp]}")
        print(f"Regressions: {regressions[comp]}")
        print()

    framedata = []
    for (comp, k), v in data.items():
        framedata.append({
            'Compiler': comp,
            'Affected stable versions': k,
            'Bugs': len(v)
        })

    plt.style.use('ggplot')
    sns.set(style="whitegrid")
    plt.rcParams['font.family'] = 'DejaVu Sans'
    plt.rcParams['figure.figsize'] = (9, 3.5)
    plt.rcParams['axes.labelsize'] = 17
    plt.rcParams['xtick.labelsize'] = 12
    plt.rcParams['font.serif'] = 'DejaVu Sans'
    plt.rcParams['font.monospace'] = 'Inconsolata Medium'
    plt.rcParams['legend.fontsize'] = 12
    plt.rcParams['axes.labelweight'] = 'bold'

    categories = [
        '[1-3]',
        '[4-6]',
        '[7-9]',
        '[10-12]',
        '> 12',
        'All',
        'master only'
    ]
    df_l = pd.DataFrame(framedata)
    print(df_l)
    ax = sns.barplot(x='Affected stable versions', y='Bugs',
                     hue='Compiler', data=df_l, order=categories,
                     palette='Greys')
    ax.legend(loc='upper left')
    plt.savefig(args.figure, format='pdf', bbox_inches='tight',
                pad_inches=0)


if __name__ == "__main__":
    main()
