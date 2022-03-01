DROP TABLE IF EXISTS "Characteristic";
CREATE TABLE Characteristic (
    cid                 INTEGER PRIMARY KEY,
    characteristic_name TEXT NOT NULL,
    category            TEXT
);

DROP TABLE IF EXISTS "CompilerBug";
CREATE TABLE CompilerBug (
    bid                 INTEGER PRIMARY KEY,
    bug_id              TEXT NOT NULL,
    language            TEXT NOT NULL,
    compiler            TEXT NOT NULL,
    title               TEXT NOT NULL,
    issue_tracker_link  TEXT NOT NULL,
    mutator             TEXT NOT NULL,
    fix_link            TEXT,
    severity            TEXT,
    status              TEXT,
    resolution          TEXT,
    report_date         TEXT,
    resolution_date     TEXT,
    symptom             TEXT,
    resolved_in         INTEGER,
    test                TEXT,
    error_msg           TEXT
);

DROP TABLE IF EXISTS "CompilerBugCharacteristics";
CREATE TABLE CompilerBugCharacteristics (
    bcid                INTEGER PRIMARY KEY,
    cid                 INTEGER NOT NULL,
    bid                 INTEGER NOT NULL,
    FOREIGN KEY (cid) REFERENCES Characteristic (cid),
    FOREIGN KEY (bid) REFERENCES CompilerBug (bid)
);
INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	1,
	"Parameterized class",
	"Parametric polymorphism"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	2,
	"Parameterized type",
	"Parametric polymorphism"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	3,
	"Parameterized function",
	"Parametric polymorphism"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	4,
	"Use-site variance",
	"Parametric polymorphism"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	5,
	"Bounded type parameter",
	"Parametric polymorphism"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	6,
	"Declaration-site variance",
	"Parametric polymorphism"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	7,
	"Inheritance",
	"OOP features"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	8,
	"Overriding",
	"OOP features"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	9,
	"Subtyping",
	"Type system-related features"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	10,
	"Primitive type",
	"Type system-related features"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	11,
	"Wildcard type",
	"Type system-related features"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	12,
	"Nothing",
	"Type system-related features"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	13,
	"Lambda",
	"Functional programming"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	14,
	"Function reference",
	"Functional programming"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	15,
	"SAM type",
	"Functional programming"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	16,
	"Function type",
	"Functional programming"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	17,
	"Conditionals",
	"Standard language features"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	18,
	"Array",
	"Standard language features"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	19,
	"Cast",
	"Standard language features"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	20,
	"Variable arguments",
	"Standard language features"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	21,
	"Type argument inference",
	"Type inference"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	22,
	"Variable type inference",
	"Type inference"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	23,
	"Parameter type inference",
	"Type inference"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	24,
	"Flow typing",
	"Type inference"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	25,
	"Return type inference",
	"Type inference"
);

INSERT INTO "Characteristic" (
	"cid", "characteristic_name", "category"
) VALUES (
	26,
	"Named arguments",
	"Other"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	1,
	"GROOVY-10373",
	"Groovy",
	"groovyc",
	"STC cannot compile program with multiple bounded type parameters",
	"https://issues.apache.org/jira/browse/GROOVY-10373",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-11-17 10:58:23+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"@groovy.transform.CompileStatic
class Main<I extends B<Character>> {
  void main() {
    C<I> x = (C<I>) null
    x.foo().bar(null)
  }
}
class A<I, E extends I>  {
  void bar(E y) {}
}
class B<T> {}
class C<S extends B<Character>> {
  A<S, ? extends S> foo() { (A<S, ? extends S>) null}
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Main.groovy: 4: [Static type checking] - Cannot call A#bar(B) with arguments [<unknown parameter type>]
 @ line 4, column 5.
       x.foo().bar(null)
       ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	2,
	"GROOVY-10371",
	"Groovy",
	"groovyc",
	"STC involves improper subtyping rules for parameterized types with wildcard types",
	"https://issues.apache.org/jira/browse/GROOVY-10371",
	"soundness",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-11-16 15:27:26+00:00",
	"None",
	"Unexpected Runtime Behavior",
	"None",
	"class A<T> {}
class B<T> extends A<T> {}
class Test {
  B<? extends Number> x = new B<Double>();
  A<Number> y = x;
}",
	""
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	3,
	"GROOVY-10370",
	"Groovy",
	"groovyc",
	"STC does not catch type error when assigning a type parameter to a variable of another type",
	"https://issues.apache.org/jira/browse/GROOVY-10370",
	"soundness",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-11-16 09:49:15+00:00",
	"None",
	"Unexpected Runtime Behavior",
	"None",
	"class A {}
class Test {
  public static void main(String[] args) {
    A x = m(1)
    System.out.println(x)
  }
  static <T> A m(T x) {
    return x;
  }
}",
	""
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	4,
	"GROOVY-10369",
	"Groovy",
	"groovyc",
	"STC does not check the upper bounds of type parameters",
	"https://issues.apache.org/jira/browse/GROOVY-10369",
	"soundness",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-11-15 11:21:48+00:00",
	"None",
	"Unexpected Runtime Behavior",
	"None",
	"class B<T1, T2 extends T1> {}
class Test {
  public static void main(String[] args) {
    var x = new B<Number, Boolean>();
  }
}",
	""
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	5,
	"GROOVY-10368",
	"Groovy",
	"groovyc",
	"STC fails to instantiate type variable when using diamond operator",
	"https://issues.apache.org/jira/browse/GROOVY-10368",
	"inference",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-11-15 09:28:37+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"class A<T extends Number> {
  A(String x) {}
}
class B {
  void m(A<Integer> x) {}
}
class Test {
  void test() {
    B x = new B();
    x.m(new A<>(""""));
  }
}",
	""
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	6,
	"GROOVY-10367",
	"Groovy",
	"groovyc",
	"STC fails to infer the correct type for type variable in the presence of the diamond operator and bounded polymorphism",
	"https://issues.apache.org/jira/browse/GROOVY-10367",
	"inference",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-11-15 09:21:35+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"class A<Z, P extends Z> {
  Z f;
  A(Z f) {}
}
class B<Z extends Number> {
  Z f;
  void test() {
    f = new A<>((Z) null).f;
  }
}",
	""
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	7,
	"GROOVY-10365",
	"Groovy",
	"groovyc",
	"STC does not perform boxing when overriding method using a parameterized class with bounded type parameters",
	"https://issues.apache.org/jira/browse/GROOVY-10365",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-11-12 12:09:11+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"interface I {
  double m(Integer x);
}
class A<T extends Number, Y> implements I {
  public double m(Integer x) {
    return 10.0;
  }
}
class B<T extends I> {
  public int f;
  double m2(A<Float, ? extends T> x) {
    return x.m(f);
  }
}",
	""
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	8,
	"GROOVY-10364",
	"Groovy",
	"groovyc",
	"STC does not type check method call when using bounded type parameter as a type argument",
	"https://issues.apache.org/jira/browse/GROOVY-10364",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-11-12 11:49:01+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"class A<T> {
  void m(B<T> x, T y) {}
}
class B<T> {}
class Test<X, Y extends X> {
  void m() {
    A<Y> x = new A<Y>();
    x.m(new B<Y>(), (Y) null);
  }
}",
	"[Static type checking] - Cannot call A#m(B<Y extends X>, Y) with arguments [B<Y>, Y]"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	9,
	"GROOVY-10363",
	"Groovy",
	"groovyc",
	"STC produces compile-time error on encoutering bounded type parameter with conditional",
	"https://issues.apache.org/jira/browse/GROOVY-10363",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-11-12 09:32:59+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"import java.util.function.Supplier;
class A {
  static final <X extends Supplier<Number>> X m(X x, X y) {
    X z = (true) ? x : y
    z
  }
}",
	"[Static type checking] - Incompatible generic argument types. Cannot assign java.util.function.Supplier<java.lang.Object> to: X"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	10,
	"GROOVY-10362",
	"Groovy",
	"groovyc",
	"STC reports an unexpected method ambiguity",
	"https://issues.apache.org/jira/browse/GROOVY-10362",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-11-11 15:28:17+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"interface I<W, Y, B extends W> {
  Y m(Y x, B y);
}
interface I2<S extends Boolean, M> extends I<S, S, S> {}
interface I3<J> extends I2<Boolean, J> {}
interface I4<X extends Number> extends I3<X> {}
class B implements I4<Number> {
  public Boolean m(Boolean x, Boolean y) {
    return false;
  }
}
abstract class C<T1 extends Integer, T2 extends T1> extends B {}
public class Test {
  void test() {
    B x = bar();
    x.m(true, false);
  }
  C<Integer, Integer> bar() {
    return null;
  }
}",
	"[Static type checking] - Reference to method is ambiguous. Cannot choose between [java.lang.Boolean B#m(java.lang.Boolean, java.lang.Boolean), Y I#m(Y, B)]"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	11,
	"GROOVY-10360",
	"Groovy",
	"groovyc",
	"STC ignores declared type of variable",
	"https://issues.apache.org/jira/browse/GROOVY-10360",
	"soundness",
	NULL,
	NULL,
	"Resolved",
	"Information Provided",
	"2021-11-10 13:22:41+00:00",
	"2021-11-12 14:53:13+00:00",
	"Unexpected Runtime Behavior",
	"2 days, 1:30:32",
	"class A {
  void m() {}
}
class Test {
  public static void main(String[] args) {
    final Object x = foo();
    x.m(); // should report an error. method `m` is not found in class Object.
  }
  public static A foo() {
    return new A();
  }
}",
	""
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	12,
	"GROOVY-10359",
	"Groovy",
	"groovyc",
	"STC misses type error when involving a variable with a char a declared type",
	"https://issues.apache.org/jira/browse/GROOVY-10359",
	"soundness",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-11-10 13:17:13+00:00",
	"None",
	"Unexpected Runtime Behavior",
	"None",
	"class Test {
  public static void main(String[] args) {
    char f = (Integer) null;
  }
}",
	""
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	13,
	"GROOVY-10358",
	"Groovy",
	"groovyc",
	"Unable to resole method after LUB operator",
	"https://issues.apache.org/jira/browse/GROOVY-10358",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-11-10 09:02:37+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"interface I {
  int m(int x);
}
abstract class A implements I {
}
class B<T> extends A {
  public int m(int x) {
    return x + 1;
  }
}
public class C<T> extends A {
  public int m(int x) {
    return x - 1;
  }
}
class Test {
  void test() {
    C<String> x = null;
    int y = 1;
    ((true) ? x : new B<String>()).m(y);
  }
}",
	"[Static type checking] - Cannot find matching method A#m(int). Please check if the declared type is correct and if the method exists."
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	14,
	"GROOVY-10357",
	"Groovy",
	"groovyc",
	"STC crashes on compiling an abstract method with default arguments and lambda",
	"https://issues.apache.org/jira/browse/GROOVY-10357",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-11-10 07:45:49+00:00",
	"None",
	"crash",
	"None",
	"import java.util.function.Function;
abstract class A {
  abstract Long m(Function<Boolean, Integer> x = { Boolean x -> x ? 10: -10})
}",
	""
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	15,
	"GROOVY-10356",
	"Groovy",
	"groovyc",
	"STC changes the inferred type of variable in the presence of flow typing",
	"https://issues.apache.org/jira/browse/GROOVY-10356",
	"inference",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-11-10 07:18:50+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"interface A {
  void a();
}
class Test {
  void test_closure() {
    def a = (A) null;
    def x = { ->
      a = null;
    }
    a.a();
  }
}",
	"[Static type checking] - A closure shared variable [a] has been assigned with various types and the method [a()] does not exist in the lowest upper bound of those types: [java.lang.Object]. In general, this is a bad practice (variable reuse) because the compiler cannot determine safely what is the type of the variable at the moment of the call in a multithreaded context."
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	16,
	"GROOVY-10351",
	"Groovy",
	"groovyc",
	"Wrong type argument is inferred on combining use-site variance and diamond operator",
	"https://issues.apache.org/jira/browse/GROOVY-10351",
	"inference",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-11-08 13:29:22+00:00",
	"2021-11-09 21:28:23+00:00",
	"Unexpected Compile-Time Error",
	"1 day, 7:59:01",
	"class A<T> {
  A(T f, B<T, ? extends T> x){  } 
}
class B<T1, T2> {}
class Test {
  void test() {
    B<Integer, ? extends Integer> x = null;
    A<Integer> y = new A<>(1, x);
  }
}",
	"[Static type checking] - Incompatible generic argument types. Cannot assign A<? extends java.lang.Object> to: A<java.lang.Integer>"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	17,
	"GROOVY-10344",
	"Groovy",
	"groovyc",
	"STC crashes when bound has two wildcard types as type arguments",
	"https://issues.apache.org/jira/browse/GROOVY-10344",
	"inference",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-11-03 16:22:50+00:00",
	"2021-11-04 16:37:01+00:00",
	"crash",
	"1 day, 0:14:11",
	"@groovy.transform.CompileStatic
class Main {
  public static final void main() {
    final def x = ((B) null).foo(new A<>(), new A<>())
  }
}
class A<O, S> {}
interface B {
  abstract <F_P extends A<? extends Number, ? extends Number>> void foo(F_P y, F_P z)
}",
	">>> a serious error occurred: BUG! exception in phase ''instruction selection'' in source unit ''Main.groovy'' Expected earlier checking to detect generics parameter arity mismatch
Expected: A<O,S>
Supplied: A<F_P extends A<? extends java.lang.Number, ? extends java.lang.Number>>
>>> stacktrace:
BUG! exception in phase ''instruction selection'' in source unit ''Main.groovy'' Expected earlier checking to detect generics parameter arity mismatch
Expected: A<O,S>
Supplied: A<F_P extends A<? extends java.lang.Number, ? extends java.lang.Number>>
        at org.codehaus.groovy.ast.tools.GenericsUtils.extractPlaceholders(GenericsUtils.java:195)
        at org.codehaus.groovy.ast.tools.GenericsUtils.extractPlaceholders(GenericsUtils.java:146)
        at org.codehaus.groovy.ast.GenericsType.compareGenericsWithBound(GenericsType.java:368)
        at org.codehaus.groovy.ast.GenericsType.checkGenerics(GenericsType.java:292)
        at org.codehaus.groovy.ast.GenericsType.isCompatibleWith(GenericsType.java:244)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingSupport.applyGenericsConnections(StaticTypeCheckingSupport.java:1622)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingSupport.inferenceCheck(StaticTypeCheckingSupport.java:1528)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingSupport.typeCheckMethodsWithGenerics(StaticTypeCheckingSupport.java:1467)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingSupport.typeCheckMethodsWithGenerics(StaticTypeCheckingSupport.java:1415)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.typeCheckMethodsWithGenericsOrFail(StaticTypeCheckingVisitor.java:5712)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitMethodCallExpression(StaticTypeCheckingVisitor.java:3524)
        at org.codehaus.groovy.transform.sc.StaticCompilationVisitor.visitMethodCallExpression(StaticCompilationVisitor.java:414)
        at org.codehaus.groovy.ast.expr.MethodCallExpression.visit(MethodCallExpression.java:77)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitBinaryExpression(StaticTypeCheckingVisitor.java:791)
        at org.codehaus.groovy.ast.CodeVisitorSupport.visitDeclarationExpression(CodeVisitorSupport.java:335)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitDeclarationExpression(ClassCodeVisitorSupport.java:154)
        at org.codehaus.groovy.ast.expr.DeclarationExpression.visit(DeclarationExpression.java:89)
        at org.codehaus.groovy.ast.CodeVisitorSupport.visitExpressionStatement(CodeVisitorSupport.java:117)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitExpressionStatement(ClassCodeVisitorSupport.java:204)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitExpressionStatement(StaticTypeCheckingVisitor.java:2190)
        at org.codehaus.groovy.ast.stmt.ExpressionStatement.visit(ExpressionStatement.java:41)
        at org.codehaus.groovy.ast.CodeVisitorSupport.visitBlockStatement(CodeVisitorSupport.java:86)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitBlockStatement(ClassCodeVisitorSupport.java:168)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitBlockStatement(StaticTypeCheckingVisitor.java:3935)
        at org.codehaus.groovy.ast.stmt.BlockStatement.visit(BlockStatement.java:70)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitClassCodeContainer(ClassCodeVisitorSupport.java:142)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitConstructorOrMethod(ClassCodeVisitorSupport.java:115)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitConstructorOrMethod(StaticTypeCheckingVisitor.java:2596)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitMethod(ClassCodeVisitorSupport.java:110)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.startMethodInference(StaticTypeCheckingVisitor.java:2585)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitMethod(StaticTypeCheckingVisitor.java:2559)
        at org.codehaus.groovy.transform.sc.StaticCompilationVisitor.visitMethod(StaticCompilationVisitor.java:239)
        at org.codehaus.groovy.ast.ClassNode.visitMethods(ClassNode.java:1134)
        at org.codehaus.groovy.ast.ClassNode.visitContents(ClassNode.java:1127)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitClass(ClassCodeVisitorSupport.java:52)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitClass(StaticTypeCheckingVisitor.java:438)
        at org.codehaus.groovy.transform.sc.StaticCompilationVisitor.visitClass(StaticCompilationVisitor.java:197)
        at org.codehaus.groovy.transform.sc.StaticCompileTransformation.visit(StaticCompileTransformation.java:68)
        at org.codehaus.groovy.transform.ASTTransformationVisitor.visitClass(ASTTransformationVisitor.java:146)
        at org.codehaus.groovy.transform.ASTTransformationVisitor.lambda$addPhaseOperations$2(ASTTransformationVisitor.java:229)
        at org.codehaus.groovy.control.CompilationUnit$IPrimaryClassNodeOperation.doPhaseOperation(CompilationUnit.java:911)
        at org.codehaus.groovy.control.CompilationUnit.processPhaseOperations(CompilationUnit.java:653)
        at org.codehaus.groovy.control.CompilationUnit.compile(CompilationUnit.java:630)
        at org.codehaus.groovy.control.CompilationUnit.compile(CompilationUnit.java:609)
        at org.codehaus.groovy.tools.FileSystemCompiler.compile(FileSystemCompiler.java:311)
        at org.codehaus.groovy.tools.FileSystemCompiler.doCompilation(FileSystemCompiler.java:240)
        at org.codehaus.groovy.tools.FileSystemCompiler.commandLineCompile(FileSystemCompiler.java:165)
        at org.codehaus.groovy.tools.FileSystemCompiler.commandLineCompileWithErrorHandling(FileSystemCompiler.java:205)
        at org.codehaus.groovy.tools.FileSystemCompiler.main(FileSystemCompiler.java:189)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	18,
	"GROOVY-10343",
	"Groovy",
	"groovyc",
	"STC fails to infer dependent type variable",
	"https://issues.apache.org/jira/browse/GROOVY-10343",
	"inference",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-11-03 15:59:08+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"class A<T1, T2 extends T1> {
  T1 f;
  A(T1 f) {
    this.f = f;
  }
  T2 foo() { return null; }
}
class Test {
  void test() {
    Integer x = 1;
    var y = new A<>(x).foo();
    Integer z = y;
  }
}",
	"[Static type checking] - Cannot assign value of type java.lang.Object to variable of type java.lang.Integer"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	19,
	"GROOVY-10342",
	"Groovy",
	"groovyc",
	"STC is unable to infer type parameter of parameterized method call",
	"https://issues.apache.org/jira/browse/GROOVY-10342",
	"inference",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-11-03 15:28:26+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"class A<T> {
  T f;
}
class Test {
  static <T> T m() { return null; }
  static <T extends Number> void test() {
    String x = m(); // works
    A<String> y = new A<>();
    y.f = m(); // works
    A<T> z = new A<T>();
    z.f = m(); // does not work
  }
}",
	"[Static type checking] - Cannot assign value of type #T to variable of type T"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	20,
	"GROOVY-10339",
	"Groovy",
	"groovyc",
	"STC instantiates parameterized function with a wrong type leading to unsoundness",
	"https://issues.apache.org/jira/browse/GROOVY-10339",
	"soundness",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-11-01 13:24:00+00:00",
	"2021-11-12 14:54:25+00:00",
	"Unexpected Runtime Behavior",
	"11 days, 1:30:25",
	"class Test {
  static <T> T bar(T x, T y) { return x; }
  static String m() { return """"; }
  static void main(String[] args) {
     Integer x = bar(m(), 1); // STC misses the error.
  }
}",
	""
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	21,
	"GROOVY-10337",
	"Groovy",
	"groovyc",
	"STC rejects program on compiling constructor initialization with a wildcard type",
	"https://issues.apache.org/jira/browse/GROOVY-10337",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-11-01 10:06:31+00:00",
	"2021-11-03 15:16:42+00:00",
	"Unexpected Compile-Time Error",
	"2 days, 5:10:11",
	"class A<T1, T2> {
  A(A<T2, ? extends T2> y) {}
}
class Test<T> {
  void test() {
    A<Number, T> x = new A<Number, T>((A<T, T>) null);
  }
}",
	"[Static type checking] - Cannot call A#<init>(A<T, ? extends java.lang.Object>) with arguments [A<T, T>]"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	22,
	"GROOVY-10336",
	"Groovy",
	"groovyc",
	"STC crashes when passing method reference to an inner closure",
	"https://issues.apache.org/jira/browse/GROOVY-10336",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-10-31 16:22:52+00:00",
	"2021-11-01 15:38:38+00:00",
	"crash",
	"23:15:46",
	"import java.util.function.Function;
import java.util.function.Supplier;
abstract class Test {
  void test() {
    Supplier<Long> keystone = () -> {
      Closure<Long> inner = (Object evolve, Supplier<Integer> x) -> null 
      inner(new Object(), new B()::m).f
    }
  }
}
class A {
  Long f
}
class B {
  Integer m() {1}
}",
	""
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	23,
	"GROOVY-10330",
	"Groovy",
	"groovyc",
	"STC instantiates type variable with a wrong type when calling an instance method of the same class",
	"https://issues.apache.org/jira/browse/GROOVY-10330",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-10-26 14:13:10+00:00",
	"2021-10-30 16:00:55+00:00",
	"Unexpected Compile-Time Error",
	"4 days, 1:47:45",
	"import java.util.function.Function;
class A<T> {
  T y;
  void foo(T x, Function<T, T> func) {
    foo((true) ? x : y, func)
  }
}",
	"[Static type checking] - Cannot call A#foo(java.lang.Object, java.util.function.Function<java.lang.Object, java.lang.Object>) with arguments [java.lang.Object<T>, java.util.function.Function<T, T>]"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	24,
	"GROOVY-10327",
	"Groovy",
	"groovyc",
	"Compiler crash when combining closure with function reference",
	"https://issues.apache.org/jira/browse/GROOVY-10327",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-10-22 22:01:22+00:00",
	"2021-10-30 16:11:18+00:00",
	"crash",
	"7 days, 18:09:56",
	"import java.util.function.Function;
@groovy.transform.TypeChecked
class A<X, Y> {
  void a() {
    Closure<Integer> x = { Function<Integer, Integer> x -> 1};
    B b = new B();
    x(b::b);
  }
}
class B {
  Integer b(Integer x) { return null; }
}",
	">>> a serious error occurred: null
>>> stacktrace:
java.lang.StackOverflowError
  at java.base/java.util.stream.MatchOps$1MatchSink.accept(MatchOps.java:90)
  at java.base/java.util.LinkedList$LLSpliterator.tryAdvance(LinkedList.java:1253)
  at java.base/java.util.stream.ReferencePipeline.forEachWithCancel(ReferencePipeline.java:127)
  at java.base/java.util.stream.AbstractPipeline.copyIntoWithCancel(AbstractPipeline.java:502)
  at java.base/java.util.stream.AbstractPipeline.copyInto(AbstractPipeline.java:488)
  at java.base/java.util.stream.AbstractPipeline.wrapAndCopyInto(AbstractPipeline.java:474)
  at java.base/java.util.stream.MatchOps$MatchOp.evaluateSequential(MatchOps.java:230)
  at java.base/java.util.stream.MatchOps$MatchOp.evaluateSequential(MatchOps.java:196)
  at java.base/java.util.stream.AbstractPipeline.evaluate(AbstractPipeline.java:234)
  at java.base/java.util.stream.ReferencePipeline.noneMatch(ReferencePipeline.java:538)
  at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.inferMethodReferenceType(StaticTypeCheckingVisitor.java:3681)
  at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitMethodCallArguments(StaticTypeCheckingVisitor.java:2794)
  at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.inferMethodReferenceType(StaticTypeCheckingVisitor.java:3708)
  at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitMethodCallArguments(StaticTypeCheckingVisitor.java:2794)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	25,
	"GROOVY-10324",
	"Groovy",
	"groovyc",
	"STC is unable to infer type variable when combining parameterized types and the diamond operator",
	"https://issues.apache.org/jira/browse/GROOVY-10324",
	"inference",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-10-21 12:03:32+00:00",
	"2021-11-01 19:03:27+00:00",
	"Unexpected Compile-Time Error",
	"11 days, 6:59:55",
	"class A {
  <T> T foo(C<T> t) { return null; }
}
class C<T> {}
class B {
  void test() {
    C<String> x = (new A()).foo(new C<>());
  }
}",
	"[Static type checking] - Cannot assign value of type java.lang.Object to variable of type C<java.lang.String>"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	26,
	"GROOVY-10323",
	"Groovy",
	"groovyc",
	"Compiler crashes on parameterized function with duplicate type variables",
	"https://issues.apache.org/jira/browse/GROOVY-10323",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-10-21 11:49:06+00:00",
	"2021-10-30 17:31:24+00:00",
	"crash",
	"9 days, 5:42:18",
	"class A {
  <T, T> T foo(T t) { return t; }
}
class C<T> {}
class B {
  void test() {
    (new A()).foo(new C<String>());
  }
}",
	""
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	27,
	"GROOVY-10322",
	"Groovy",
	"groovyc",
	"Type variable of function does not shadow the corresponding type variable of class",
	"https://issues.apache.org/jira/browse/GROOVY-10322",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-10-21 11:35:11+00:00",
	"2021-11-04 00:50:45+00:00",
	"Unexpected Compile-Time Error",
	"13 days, 13:15:34",
	"class A<T> {
  <T> T foo(T t) { return t; }
}
class B {
  void bar(int x) {}
  void test() {
    int x = (new A<String>()).foo(1);
  }
}",
	"[Static type checking] - Cannot find matching method A#foo(int). Please check if the declared type is correct and if the method exists."
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	28,
	"GROOVY-10317",
	"Groovy",
	"groovyc",
	"Type variable substitution does not work properly on parameterized function''s return type",
	"https://issues.apache.org/jira/browse/GROOVY-10317",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-10-19 11:28:46+00:00",
	"2021-11-01 17:29:35+00:00",
	"Unexpected Compile-Time Error",
	"13 days, 6:00:49",
	"class A<T1, T2> {
  void m1(T1 x) {}
  void test() {
    var x = new B();
    T2 y = null;
    (new A<T2, T2>()).m1(x.m2(y));
  }
}
class B {
  <X, Y> X m2(Y x) { return null; }
}",
	"[Static type checking] - Cannot call A#m1(T2) with arguments [#X]"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	29,
	"GROOVY-10316",
	"Groovy",
	"groovyc",
	"Type variable inference does not work properly in nested diamond operators",
	"https://issues.apache.org/jira/browse/GROOVY-10316",
	"inference",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-10-18 14:24:43+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"class A<T> {
  T f;
  A(T f) {
    this.f = f;
  }
}
class B<T> {
  A<T> f;
  B(A<T> f) {
    this.f = f;
  }
}
class Test {
  void test() {
    def x = new  B<>(new A<>((long) 1)).f;
    A<Long> y = x;
  }
}",
	"[Static type checking] - Incompatible generic argument types. Cannot assign A<java.lang.Object> to: A<java.lang.Long>"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	30,
	"GROOVY-10315",
	"Groovy",
	"groovyc",
	"Unable to infer type variable of parameterized function that expects two parameters",
	"https://issues.apache.org/jira/browse/GROOVY-10315",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-10-18 13:54:47+00:00",
	"2021-11-01 00:11:47+00:00",
	"Unexpected Compile-Time Error",
	"13 days, 10:17:00",
	"class A<T> {
  void m(T x) {}
  <T2> T m2() {
    return null;
  }
}
class Main {
  <T> void m1() {
    A<T> x = new A<T>();
    m3(m2(), x.m2()); // does not work
  }
  <T> T m2() {
    return null;
  }
  <T> void m3(T x, T y) {}
}",
	"[Static type checking] - Cannot call <T> Main#m3(T, T) with arguments [#T, T]"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	31,
	"GROOVY-10310",
	"Groovy",
	"groovyc",
	"STC is unable to call parameterized function",
	"https://issues.apache.org/jira/browse/GROOVY-10310",
	"inference",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-10-15 12:50:43+00:00",
	"2021-11-02 17:16:37+00:00",
	"Unexpected Compile-Time Error",
	"18 days, 4:25:54",
	"class A<T> {
  T f;
  A(T f) {
    this.f = f;
  }
  A() {}
}
class B<T> {}
class Test {
  static <T> A<T> test(T x, B<? extends T> z) {
    return new A<>(x);
  }
  public static void main(String[] args) {
    var d = ""d"";
    test(d, new B<>());
  }
}",
	"[Static type checking] - Cannot call <T> Test#test(T, B<? extends java.lang.Object>) with arguments [java.lang.String, B<java.lang.Object extends T>]"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	32,
	"GROOVY-10309",
	"Groovy",
	"groovyc",
	"Improper type variable substitution when involving type parameters with conficting names",
	"https://issues.apache.org/jira/browse/GROOVY-10309",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-10-15 12:27:21+00:00",
	"2021-11-01 01:52:17+00:00",
	"Unexpected Compile-Time Error",
	"16 days, 13:24:56",
	"class A<T, Y> {
  T f1;
  Y f2;
  A(T f1, Y f2) {
    this.f1 = f1;
    this.f2 = f2;
  }
}
class C<T, X> {
  void test() {
    A<X, T> x = new A<X, T>((X) null, (T) null);
  }
}",
	"[Static type checking] - Cannot call A#<init>(X, T) with arguments [X, T]"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	33,
	"GROOVY-10308",
	"Groovy",
	"groovyc",
	"SC incorrectly reports ""access to Object#field"" is forbidden",
	"https://issues.apache.org/jira/browse/GROOVY-10308",
	"inference",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-10-15 11:56:20+00:00",
	"2021-10-24 00:14:34+00:00",
	"Unexpected Compile-Time Error",
	"8 days, 12:18:14",
	"class A<T> {
  T p
}
@groovy.transform.CompileStatic
void test() {
  def x = { -> new A<String>() }
  def y = x()
  def z = y.p
  y = null // changes inferred type
}
test()",
	"Access to java.lang.Object#f is forbidden"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	34,
	"GROOVY-10306",
	"Groovy",
	"groovyc",
	"STC rejects program when assigning a closure that returns a class field",
	"https://issues.apache.org/jira/browse/GROOVY-10306",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-10-14 14:52:15+00:00",
	"2021-10-30 15:15:13+00:00",
	"Unexpected Compile-Time Error",
	"16 days, 0:22:58",
	"import java.util.function.Supplier;
class Main {
    byte x = 1;
    void foo() {
        Supplier<Number> y =  () -> x;
    }
}",
	"[Static type checking] - Incompatible generic argument types. Cannot assign java.util.function.Supplier<java.lang.Byte> to: java.util.function.Supplier<java.lang.Number>"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	35,
	"GROOVY-10294",
	"Groovy",
	"groovyc",
	"Variable''s inferred type is upcasted to an Object",
	"https://issues.apache.org/jira/browse/GROOVY-10294",
	"inference",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-10-11 14:10:05+00:00",
	"2021-10-31 00:26:08+00:00",
	"Unexpected Compile-Time Error",
	"19 days, 10:16:03",
	"class A {
  A foo() {
    def x = new A()
    if (false) {
      x = null
    }
    x
  }
}",
	"[Static type checking] - Cannot return value of type java.lang.Object on method returning type A"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	36,
	"GROOVY-10291",
	"Groovy",
	"groovyc",
	"STC fails to substitute type variable when using the diamond operator and calling a closure",
	"https://issues.apache.org/jira/browse/GROOVY-10291",
	"inference",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-10-08 12:23:04+00:00",
	"2021-11-02 00:55:35+00:00",
	"Unexpected Compile-Time Error",
	"24 days, 12:32:31",
	"class A<X> {
  X x;
  A(X x) {
    this.x = x
  }
}
class Test<T> {
  void foo() {
    def closure = { T p -> """" }
    T y = null
    bar(new A<>(y).x) // works
    closure(new A<>(y).x) // fails
  }
  void bar(T x) {} 
}",
	"[Static type checking] - Cannot call closure that accepts [T] with [X]"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	37,
	"GROOVY-10283",
	"Groovy",
	"groovyc",
	"Cannot assign type parameter whose bound is a parameterized type that takes a wildcard",
	"https://issues.apache.org/jira/browse/GROOVY-10283",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-10-05 07:22:48+00:00",
	"2021-10-10 13:34:22+00:00",
	"Unexpected Compile-Time Error",
	"5 days, 6:11:34",
	"class A<T1, T2> {}
class B<T1 extends Number, T2 extends A<C, ? extends T1>> {
  T2 f;
  B(T2 f) {
    this.f  = f;
  }
}
class C {}",
	"[Static type checking] - Cannot assign value of type A<C, ? extends java.lang.Number<T1 extends java.lang.Number>> to variable of type T2"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	38,
	"GROOVY-10280",
	"Groovy",
	"groovyc",
	"Type variable substitution does not work well when running into chain of field accesses",
	"https://issues.apache.org/jira/browse/GROOVY-10280",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-10-04 13:46:39+00:00",
	"2021-10-10 15:40:24+00:00",
	"Unexpected Compile-Time Error",
	"6 days, 1:53:45",
	"class Foo<T> {
  T foo() {
    new Bar<T>().f1.f2.f3;
  }
}
class Bar<Y> {
  Baz<Y> f1;
}
class Baz<T> {
  Qux<T> f2;
}
class Qux<X> {
  X f3;
}",
	"[Static type checking] - Cannot return value of type Y on method returning type T"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	39,
	"GROOVY-10277",
	"Groovy",
	"groovyc",
	"STC fails to catch type error on the return type of lambdas",
	"https://issues.apache.org/jira/browse/GROOVY-10277",
	"soundness",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-10-01 15:27:16+00:00",
	"2021-11-16 18:29:45+00:00",
	"Unexpected Runtime Behavior",
	"46 days, 3:02:29",
	"import java.util.function.Supplier;
class Main {
  static void main(String[] args) {
    bar({ -> true}); // should not type-check
    bar({ -> true} as Supplier<Long>); // should not type-check.
  }
  static Long bar(Supplier<Long> x) {
    x.get()
  }
}",
	""
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	40,
	"GROOVY-10272",
	"Groovy",
	"groovyc",
	"Wrong inference when using ternary operator with lambdas",
	"https://issues.apache.org/jira/browse/GROOVY-10272",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-09-29 08:34:29+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"import java.util.function.Function;
@groovy.transform.TypeChecked
class Main {
    public static final void main() {
        Function<Long, Double> x
        // Works
        if (true) {
            x = {Long a -> (Double) a}
        } else {
            x = {Long b -> (Double) b}
        }
        // Fails
        Function<Long, Double> y = ((true) ? {Long a -> (Double) a} : {Long b -> (Double) b})
    }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Main.groovy: 16: [Static type checking] - Cannot assign value of type java.lang.Double to variable of type java.util.function.Function<java.lang.Long, java.lang.Double>
 @ line 16, column 36.
           Function<Long, Double> y = ((true) ? {Long a -> (Double) a} : {Long b -> (Double) b})
                                      ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	41,
	"GROOVY-10271",
	"Groovy",
	"groovyc",
	"Wrong inference when using ternary operator with closure and variable",
	"https://issues.apache.org/jira/browse/GROOVY-10271",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-09-29 08:23:49+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"import java.util.function.Supplier;
@groovy.transform.TypeChecked
class Main {
  static final void foo(Supplier<Integer> x) {}
  public static final void main() {
      Supplier<Integer> y = { -> 5 }
      Supplier<Integer> z = (true) ? y : {-> 5}
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Main.groovy: 11: [Static type checking] - Cannot assign value of type java.lang.Object to variable of type java.util.function.Supplier<java.lang.Integer>
 @ line 11, column 29.
         Supplier<Integer> z = (true) ? y : {-> 5}
                               ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	42,
	"GROOVY-10270",
	"Groovy",
	"groovyc",
	"Cannot initialize parameterized class with lambda without cast",
	"https://issues.apache.org/jira/browse/GROOVY-10270",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-09-29 08:08:37+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"import java.util.function.Function;
@groovy.transform.TypeChecked
class Main {
   static final void foo(Function<Short, Byte> x) {}
   public static final void main() {
     foo({Short y -> (Byte) y}) // works
     Cls cls = new Cls({Short y -> (Byte) y}) // works
     PCls<Function<Short, Byte>> pcls1 = new PCls<Function<Short, Byte>>({Short y -> (Byte) y} as Function<Short, Byte>) // works
     PCls<Function<Short, Byte>> pcls2 = new PCls<Function<Short, Byte>>({Short y -> (Byte) y}) // fails
   }
}
class Cls {
  public Function<Short, Byte> f
  public Cls(Function<Short, Byte> f) {
     this.f = f
  }
}
class PCls <T> {
   public T f
   public PCls(T f) {
      this.f = f
   }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Main.groovy: 14: [Static type checking] - Cannot call PCls#<init>(java.util.function.Function<java.lang.Short, java.lang.Byte>) with arguments [groovy.lang.Closure]
@ line 14, column 41.
unction<Short, Byte>> pcls2 = new PCls<F
^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	43,
	"GROOVY-10269",
	"Groovy",
	"groovyc",
	"STC: Stackoverflow Error when passing function reference to closure",
	"https://issues.apache.org/jira/browse/GROOVY-10269",
	"inference",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-09-28 08:07:17+00:00",
	"2021-10-12 20:52:35+00:00",
	"crash",
	"14 days, 12:45:18",
	"import java.util.function.Consumer;
@groovy.transform.TypeChecked
class Test {
  static final void foo(Integer y) {}
  static final void bar(Consumer<Integer> x) {}
  public static void main () {
    def qux = { Consumer<Integer> x -> }
    Test.bar(Test::foo) // OK
    qux(Test::foo) // Crashes
  }
}",
	">>> a serious error occurred: null
>>> stacktrace:
java.lang.StackOverflowError
  at java.base/java.util.stream.MatchOps$1MatchSink.accept(MatchOps.java:90)
  at java.base/java.util.LinkedList$LLSpliterator.tryAdvance(LinkedList.java:1253)
  at java.base/java.util.stream.ReferencePipeline.forEachWithCancel(ReferencePipeline.java:127)
  at java.base/java.util.stream.AbstractPipeline.copyIntoWithCancel(AbstractPipeline.java:502)
  at java.base/java.util.stream.AbstractPipeline.copyInto(AbstractPipeline.java:488)
  at java.base/java.util.stream.AbstractPipeline.wrapAndCopyInto(AbstractPipeline.java:474)
  at java.base/java.util.stream.MatchOps$MatchOp.evaluateSequential(MatchOps.java:230)
  at java.base/java.util.stream.MatchOps$MatchOp.evaluateSequential(MatchOps.java:196)
  at java.base/java.util.stream.AbstractPipeline.evaluate(AbstractPipeline.java:234)
  at java.base/java.util.stream.ReferencePipeline.noneMatch(ReferencePipeline.java:538)
  at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.inferMethodReferenceType(StaticTypeCheckingVisitor.java:3653)
  at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitMethodCallArguments(StaticTypeCheckingVisitor.java:2814)
    ...
  at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitMethodCallArguments(StaticTypeCheckingVisitor.java:2814)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	44,
	"GROOVY-10268",
	"Groovy",
	"groovyc",
	"Unable to assign variable in parameterized class with bounded polymorphism ",
	"https://issues.apache.org/jira/browse/GROOVY-10268",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Duplicate",
	"2021-09-28 05:58:02+00:00",
	"2021-09-28 06:27:03+00:00",
	"Unexpected Compile-Time Error",
	"0:29:01",
	"@groovy.transform.TypeChecked
class Cls<T, Z extends T> {
  public final Z foo
  public Upbeat(Z foo) {
    this.foo = foo
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Main.groovy: 5: [Static type checking] - Cannot assign value of type T to variable of type Z
 @ line 5, column 16.
       this.foo = foo
                  ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	45,
	"GROOVY-10267",
	"Groovy",
	"groovyc",
	"STC reports wrong message when encoutering wildcard types",
	"https://issues.apache.org/jira/browse/GROOVY-10267",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-09-27 13:52:33+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"class A<T> {}
class B {
  A<? extends Object> test() {
    return test2();
  }  A<? extends Object> test2() {
    return null;
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
test.groovy: 6: [Static type checking] - Incompatible generic argument types. Cannot assign A<?> to: A<? extends java.lang.Object>
 @ line 6, column 12.
       return test2();
              ^1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	46,
	"GROOVY-10266",
	"Groovy",
	"groovyc",
	"The diamond operator does not work when passing a value whose type is a type variable",
	"https://issues.apache.org/jira/browse/GROOVY-10266",
	"inference",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-09-27 13:17:21+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"class A<T> {
  void foo() {
    T z = null;
    T x = new B<>(z).f // does not work
    String y = """"
    String k = new B<>(y).f // works
  }
}
class B<X> {
  X f;
  B(X f) {
    this.f = f;
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
test.groovy: 4: [Static type checking] - Cannot assign value of type X to variable of type T
 @ line 4, column 11.
       T x = new B<>(z).f // does not work
             ^1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	47,
	"GROOVY-10265",
	"Groovy",
	"groovyc",
	"STC is unable to resolve variable in closure",
	"https://issues.apache.org/jira/browse/GROOVY-10265",
	"inference",
	NULL,
	NULL,
	"Resolved",
	"Information Provided",
	"2021-09-27 12:32:30+00:00",
	"2021-10-31 00:27:32+00:00",
	"Unexpected Compile-Time Error",
	"33 days, 11:55:02",
	"import java.util.function.Supplier;
class B {
  Supplier<Integer> m2() {
    final def x = 1
    { -> x + 1 }
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
test.groovy: 5: [Static type checking] - Cannot find matching method int#call(groovy.lang.Closure). Please check if the declared type is correct and if the method exists.
 @ line 5, column 19.
       final def x = 1
                     ^test.groovy: 6: [Static type checking] - The variable [x] is undeclared.
 @ line 6, column 10.
       { -> x + 1 }
            ^test.groovy: 5: [Static type checking] - Cannot return value of type java.lang.Object on method returning type java.util.function.Supplier<java.lang.Integer>
 @ line 5, column 5.
       final def x = 1
       ^3 errors"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	48,
	"GROOVY-10264",
	"Groovy",
	"groovyc",
	"Issue with the diamond operator and conditional",
	"https://issues.apache.org/jira/browse/GROOVY-10264",
	"inference",
	NULL,
	NULL,
	"Closed",
	"Duplicate",
	"2021-09-27 12:10:08+00:00",
	"2021-09-27 12:13:43+00:00",
	"Unexpected Compile-Time Error",
	"0:03:35",
	"class A<T extends Number> {
  T foo() {
    T x = null;
    (true) ?
      new B<>(x).f: new B<>(x).f
  }
}
class B<X> {
  X f;
  B(X x) {
    this.f = f;
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
test.groovy: 4: [Static type checking] - Cannot return value of type java.lang.Object on method returning type T
 @ line 4, column 5.
       (true) ?
       ^1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	49,
	"GROOVY-10254",
	"Groovy",
	"groovyc",
	"STC: cannot return closure from method without casting",
	"https://issues.apache.org/jira/browse/GROOVY-10254",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-09-23 03:30:40+00:00",
	"2021-09-26 21:53:20+00:00",
	"Unexpected Compile-Time Error",
	"3 days, 18:22:40",
	"import java.util.function.Supplier;
@groovy.transform.TypeChecked
public class Main {
    public static Supplier<Integer> foo() {
        { -> 10} as Supplier<Integer> // works
    }
    public static Supplier<Integer> bar() {
        { -> 10} //fails
    }
    public static void main(String[] args) {
        Supplier<Integer> v1 = { -> 10} as Supplier<Integer> // works
        Supplier<Integer> v2 = { -> 10} // works
        Supplier<Integer> v3 = foo()
        Supplier<Integer> v4 = bar()
    }
}",
	"Main.groovy: 10: [Static type checking] - Cannot return value of type groovy.lang.Closure<java.lang.Integer> on method returning type java.util.function.Supplier<java.lang.Integer>
 @ line 10, column 9.
           { -> 10} //fails
           ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	50,
	"GROOVY-10251",
	"Groovy",
	"groovyc",
	"STC infers a type that does not respect the bound of type variable",
	"https://issues.apache.org/jira/browse/GROOVY-10251",
	"soundness",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-09-22 07:13:05+00:00",
	"None",
	"Unexpected Runtime Behavior",
	"None",
	"class A<T1, T2> {
  T2 x;
  A(T2 x) {
    this.x = x;
  } 
}
class B {
  <T1 extends Number, T2 extends A<Float, T1>> void foo(T2 x1, T1 x2) {
    T1 y = x1.x; // CCE at runtime
  }
}
class C<T extends D> {
  T x;
  C(T x) {
    this.x = x;
  }
  void test() {
    (new B()).foo(x, foo());
  }
  static <X extends Number> X foo() {
    return null;
  }
}
class D extends A<Float, String> {
  D() {
    super("""");
  }
}
class Main {
  public static void main(String[] args) {
    (new C<D>(new D())).test();
  }
}",
	"Exception in thread ""main"" org.codehaus.groovy.runtime.typehandling.GroovyCastException: Cannot cast object '''' with class ''java.lang.String'' to class ''java.lang.Number''
        at org.codehaus.groovy.runtime.typehandling.DefaultTypeTransformation.castToNumber(DefaultTypeTransformation.java:179)
        at org.codehaus.groovy.runtime.typehandling.DefaultTypeTransformation.continueCastOnNumber(DefaultTypeTransformation.java:294)
        at org.codehaus.groovy.runtime.typehandling.DefaultTypeTransformation.castToType(DefaultTypeTransformation.java:251)
        at org.codehaus.groovy.vmplugin.v8.IndyInterface.fromCache(IndyInterface.java:318)
        at B.foo(groovy16.groovy:10)
        at C.test(groovy16.groovy:21)
        at Main.main(groovy16.groovy:38)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	51,
	"GROOVY-10230",
	"Groovy",
	"groovyc",
	"Unexpected generics parameter arity mismatch in the ""instruction selection"" phase",
	"https://issues.apache.org/jira/browse/GROOVY-10230",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-09-13 12:39:25+00:00",
	"2021-11-04 16:37:10+00:00",
	"crash",
	"52 days, 3:57:45",
	"class Foo<T1, T2> {}
class A {
  <T extends Foo<Number, Number>> T m(T x) {
    x
  }
}
class B extends A {
  <T extends Foo<Number, Number>> T m(T x) {
    T z = null;
    super.m((true) ? z : z)
  }
}",
	">>> a serious error occurred: BUG! exception in phase ''instruction selection'' in source unit ''test.groovy'' Expected earlier checking to detect generics parameter arity mismatch
Expected: Foo<T1,T2>
Supplied: Foo<T>
>>> stacktrace:
BUG! exception in phase ''instruction selection'' in source unit ''test.groovy'' Expected earlier checking to detect generics parameter arity mismatch
Expected: Foo<T1,T2>
Supplied: Foo<T>
        at org.codehaus.groovy.ast.tools.GenericsUtils.extractPlaceholders(GenericsUtils.java:195)
        at org.codehaus.groovy.ast.tools.GenericsUtils.extractPlaceholders(GenericsUtils.java:146)
        at org.codehaus.groovy.ast.GenericsType.compareGenericsWithBound(GenericsType.java:384)
        at org.codehaus.groovy.ast.GenericsType.checkGenerics(GenericsType.java:308)
        at org.codehaus.groovy.ast.GenericsType.isCompatibleWith(GenericsType.java:259)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingSupport.applyGenericsConnections(StaticTypeCheckingSupport.java:1610)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.inferReturnTypeGenerics(StaticTypeCheckingVisitor.java:5323)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitMethodCallExpression(StaticTypeCheckingVisitor.java:3578)
        at org.codehaus.groovy.transform.sc.StaticCompilationVisitor.visitMethodCallExpression(StaticCompilationVisitor.java:414)
        at org.codehaus.groovy.ast.expr.MethodCallExpression.visit(MethodCallExpression.java:77)
        at org.codehaus.groovy.ast.CodeVisitorSupport.visitExpressionStatement(CodeVisitorSupport.java:117)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitExpressionStatement(ClassCodeVisitorSupport.java:204)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitExpressionStatement(StaticTypeCheckingVisitor.java:2169)
        at org.codehaus.groovy.ast.stmt.ExpressionStatement.visit(ExpressionStatement.java:41)
        at org.codehaus.groovy.ast.CodeVisitorSupport.visitBlockStatement(CodeVisitorSupport.java:86)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitBlockStatement(ClassCodeVisitorSupport.java:168)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitBlockStatement(StaticTypeCheckingVisitor.java:3992)
        at org.codehaus.groovy.ast.stmt.BlockStatement.visit(BlockStatement.java:70)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitClassCodeContainer(ClassCodeVisitorSupport.java:142)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitConstructorOrMethod(ClassCodeVisitorSupport.java:115)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitConstructorOrMethod(StaticTypeCheckingVisitor.java:2602)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitMethod(ClassCodeVisitorSupport.java:110)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.startMethodInference(StaticTypeCheckingVisitor.java:2591)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitMethod(StaticTypeCheckingVisitor.java:2565)
        at org.codehaus.groovy.transform.sc.StaticCompilationVisitor.visitMethod(StaticCompilationVisitor.java:239)
        at org.codehaus.groovy.ast.ClassNode.visitMethods(ClassNode.java:1131)
        at org.codehaus.groovy.ast.ClassNode.visitContents(ClassNode.java:1124)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitClass(ClassCodeVisitorSupport.java:52)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitClass(StaticTypeCheckingVisitor.java:436)
        at org.codehaus.groovy.transform.sc.StaticCompilationVisitor.visitClass(StaticCompilationVisitor.java:197)
        at org.codehaus.groovy.transform.sc.StaticCompileTransformation.visit(StaticCompileTransformation.java:68)
        at org.codehaus.groovy.control.customizers.ASTTransformationCustomizer.call(ASTTransformationCustomizer.groovy:298)
        at org.codehaus.groovy.control.CompilationUnit$IPrimaryClassNodeOperation.doPhaseOperation(CompilationUnit.java:925)
        at org.codehaus.groovy.control.CompilationUnit.processPhaseOperations(CompilationUnit.java:654)
        at org.codehaus.groovy.control.CompilationUnit.compile(CompilationUnit.java:631)
        at org.codehaus.groovy.control.CompilationUnit.compile(CompilationUnit.java:607)
        at org.codehaus.groovy.tools.FileSystemCompiler.compile(FileSystemCompiler.java:311)
        at org.codehaus.groovy.tools.FileSystemCompiler.doCompilation(FileSystemCompiler.java:240)
        at org.codehaus.groovy.tools.FileSystemCompiler.commandLineCompile(FileSystemCompiler.java:165)
        at org.codehaus.groovy.tools.FileSystemCompiler.commandLineCompileWithErrorHandling(FileSystemCompiler.java:205)
        at org.codehaus.groovy.tools.FileSystemCompiler.main(FileSystemCompiler.java:189)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	52,
	"GROOVY-10228",
	"Groovy",
	"groovyc",
	"STC fails to substitute type variable in the presence of the diamond operator and a function call",
	"https://issues.apache.org/jira/browse/GROOVY-10228",
	"inference",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-09-13 11:48:22+00:00",
	"2021-11-02 17:16:53+00:00",
	"Unexpected Compile-Time Error",
	"50 days, 5:28:31",
	"class A<T> {
  T x;  A(T x) {
    this.x = x;
  }
  T getX() {
    return x;
  }
}
class B {}
class Main {
  public static void m1() {
    def x = new B();
    m2(new A<>(x).getX());
  }  public static void m2(B x) {}
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
test.groovy: 18: [Static type checking] - Cannot find matching method Main#m2(T). Please check if the declared type is correct and if the method exists.
 @ line 18, column 5.
       m2(new A<>(x).getX());
       ^1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	53,
	"GROOVY-10227",
	"Groovy",
	"groovyc",
	"STC computes an imprecise LUB when involving two parameterized types implementing the same interface",
	"https://issues.apache.org/jira/browse/GROOVY-10227",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-09-13 09:55:21+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"class A {
  void foo(I x) {}
}
interface I {}
interface I2 extends I {}
class B<T> implements I2 {}
class C<T> implements I {}
class Main {
  public static void main(String[] args) {
    (new A()).foo((true) ? new B<String>() : new C<String>());
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
test.groovy: 12: [Static type checking] - Cannot find matching method A#foo(java.lang.Object). Please check if the declared type is correct and if the method exists.
 @ line 12, column 5.
       (new A()).foo((true) ? new B<String>() : new C<String>());
       ^1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	54,
	"GROOVY-10226",
	"Groovy",
	"groovyc",
	"LUB is computed incorrectly when involving bounded type variables",
	"https://issues.apache.org/jira/browse/GROOVY-10226",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-09-13 09:31:07+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"class Foo<T> {}class Main {
  static final <T extends Foo<String>> T test() {
    final T x = null;
    true ? (T) null: x
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
test.groovy: 6: [Static type checking] - Cannot return value of type Foo<java.lang.Object> on method returning type T
 @ line 6, column 5.
       true ? (T) null: x
       ^1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	55,
	"GROOVY-10225",
	"Groovy",
	"groovyc",
	"Unexpected NullPointerException during the ""instruction selection"" phase",
	"https://issues.apache.org/jira/browse/GROOVY-10225",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-09-13 09:13:57+00:00",
	"2021-09-27 22:11:45+00:00",
	"crash",
	"14 days, 12:57:48",
	"class Foo<Z> {
  final Z foo(Z x) {
    null;
  }
}
final class Bar<Y> {  final Foo<Y> bar() {
    new Foo<>()
  }
}
class Main {
  static final <F_O extends Number, F_X extends F_O> void test() {
    final F_X x = (F_X) null
    (new Bar<F_O>()).bar().foo(((false) ? x : (F_X) null))
  }
}",
	">>> a serious error occurred: BUG! exception in phase ''instruction selection'' in source unit ''test.groovy'' unexpected NullPointerException
>>> stacktrace:
BUG! exception in phase ''instruction selection'' in source unit ''test.groovy'' unexpected NullPointerException
        at org.codehaus.groovy.control.CompilationUnit$IPrimaryClassNodeOperation.doPhaseOperation(CompilationUnit.java:930)
        at org.codehaus.groovy.control.CompilationUnit.processPhaseOperations(CompilationUnit.java:654)
        at org.codehaus.groovy.control.CompilationUnit.compile(CompilationUnit.java:631)
        at org.codehaus.groovy.control.CompilationUnit.compile(CompilationUnit.java:607)
        at org.codehaus.groovy.tools.FileSystemCompiler.compile(FileSystemCompiler.java:311)
        at org.codehaus.groovy.tools.FileSystemCompiler.doCompilation(FileSystemCompiler.java:240)
        at org.codehaus.groovy.tools.FileSystemCompiler.commandLineCompile(FileSystemCompiler.java:165)
        at org.codehaus.groovy.tools.FileSystemCompiler.commandLineCompileWithErrorHandling(FileSystemCompiler.java:205)
        at org.codehaus.groovy.tools.FileSystemCompiler.main(FileSystemCompiler.java:189)
Caused by: java.lang.NullPointerException
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.resolvePlaceholdersFromImplicitTypeHints(StaticTypeCheckingVisitor.java:5439)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitMethodCallExpression(StaticTypeCheckingVisitor.java:3596)
        at org.codehaus.groovy.transform.sc.StaticCompilationVisitor.visitMethodCallExpression(StaticCompilationVisitor.java:414)
        at org.codehaus.groovy.ast.expr.MethodCallExpression.visit(MethodCallExpression.java:77)
        at org.codehaus.groovy.ast.CodeVisitorSupport.visitExpressionStatement(CodeVisitorSupport.java:117)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitExpressionStatement(ClassCodeVisitorSupport.java:204)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitExpressionStatement(StaticTypeCheckingVisitor.java:2169)
        at org.codehaus.groovy.ast.stmt.ExpressionStatement.visit(ExpressionStatement.java:41)
        at org.codehaus.groovy.ast.CodeVisitorSupport.visitBlockStatement(CodeVisitorSupport.java:86)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitBlockStatement(ClassCodeVisitorSupport.java:168)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitBlockStatement(StaticTypeCheckingVisitor.java:3992)
        at org.codehaus.groovy.ast.stmt.BlockStatement.visit(BlockStatement.java:70)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitClassCodeContainer(ClassCodeVisitorSupport.java:142)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitConstructorOrMethod(ClassCodeVisitorSupport.java:115)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitConstructorOrMethod(StaticTypeCheckingVisitor.java:2602)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitMethod(ClassCodeVisitorSupport.java:110)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.startMethodInference(StaticTypeCheckingVisitor.java:2591)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitMethod(StaticTypeCheckingVisitor.java:2565)
        at org.codehaus.groovy.transform.sc.StaticCompilationVisitor.visitMethod(StaticCompilationVisitor.java:239)
        at org.codehaus.groovy.ast.ClassNode.visitMethods(ClassNode.java:1131)
        at org.codehaus.groovy.ast.ClassNode.visitContents(ClassNode.java:1124)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitClass(ClassCodeVisitorSupport.java:52)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitClass(StaticTypeCheckingVisitor.java:436)
        at org.codehaus.groovy.transform.sc.StaticCompilationVisitor.visitClass(StaticCompilationVisitor.java:197)
        at org.codehaus.groovy.transform.sc.StaticCompileTransformation.visit(StaticCompileTransformation.java:68)
        at org.codehaus.groovy.control.customizers.ASTTransformationCustomizer.call(ASTTransformationCustomizer.groovy:298)
        at org.codehaus.groovy.control.CompilationUnit$IPrimaryClassNodeOperation.doPhaseOperation(CompilationUnit.java:925)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	56,
	"GROOVY-10222",
	"Groovy",
	"groovyc",
	"Unable to infer the type parameter of a parameterized function",
	"https://issues.apache.org/jira/browse/GROOVY-10222",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-09-10 12:53:02+00:00",
	"2021-10-12 15:31:19+00:00",
	"Unexpected Compile-Time Error",
	"32 days, 2:38:17",
	"class A {
    static <T> T foo() {
        return null;
    }
}
class Test<T> {
    void bar() {
        T x = A.foo();
    }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
groovy11.groovy: 9: [Static type checking] - Cannot assign value of type #T to variable of type T
 @ line 9, column 15.
           T x = A.foo();
                 ^1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	57,
	"GROOVY-10221",
	"Groovy",
	"groovyc",
	"Unexpected compile-time error when combining closures and bounded type parameters",
	"https://issues.apache.org/jira/browse/GROOVY-10221",
	"inference",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-09-10 12:18:19+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"class A<T1, T2 extends T1> {
  void foo() {
    def cls1 = { T2 x -> """" }
    Closure<T2> cls2 = { T2 x -> x }
    cls1(cls2((T2) null))
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
test.groovy: 5: [Static type checking] - Cannot call closure that accepts [T2] with [T1]
 @ line 5, column 9.
       cls1(cls2((T2) null))
           ^1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	58,
	"GROOVY-10220",
	"Groovy",
	"groovyc",
	"Unexpected type mismatch when having conflicting type parameter names",
	"https://issues.apache.org/jira/browse/GROOVY-10220",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-09-10 12:09:11+00:00",
	"2021-09-21 20:52:19+00:00",
	"Unexpected Compile-Time Error",
	"11 days, 8:43:08",
	"class A<X, T extends Number> {}
class B<T> {
  A<? extends T, Number> x;
  B(A<? extends T, Number> x) {
    this.x = x;
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
test.groovy: 5: [Static type checking] - Incompatible generic argument types. Cannot assign A<java.lang.Object, java.lang.Number> to: A<? extends T, java.lang.Number>
 @ line 5, column 14.
       this.x = x;
                ^1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	59,
	"GROOVY-10158",
	"Groovy",
	"groovyc",
	"Unexpected type mismatch when combining conditional and bounded type parameter",
	"https://issues.apache.org/jira/browse/GROOVY-10158",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-06-30 10:45:47+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"class A<T> {}
class B<T extends A<String>> {
  T m() {
    final T x = null;
    final T y = null;
    (true) ? y : x
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
test.groovy: 7: [Static type checking] - Cannot return value of type A<java.lang.Object> on method returning type T
 @ line 7, column 5.
       (true) ? y : x
       ^1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	60,
	"GROOVY-10153",
	"Groovy",
	"groovyc",
	"STC: cannot combine use-variance with bounded polymorphism",
	"https://issues.apache.org/jira/browse/GROOVY-10153",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-06-28 17:21:24+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"@groovy.transform.TypeChecked
class Test {
  public void m() {
    Foo<? super C> x = new Foo<B>();
  }
}
class A {}
class B extends A {}
class C extends B {}
class Foo<T extends A> {
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Test.groovy: 4: The type ? is not a valid substitute for the bounded parameter <T extends A>
 @ line 4, column 9.
       Foo<? super C> x = new Foo<B>();
           ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	61,
	"GROOVY-10130",
	"Groovy",
	"groovyc",
	"Flow typing does not work when && is combinded with instanceof",
	"https://issues.apache.org/jira/browse/GROOVY-10130",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-06-08 11:15:41+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"@groovy.transform.TypeChecked
class Test {
  public void foo(Foo x) {
    ((true && x instanceof Bar)) ? new Bar[]{x} : null
  }
}
class Foo {}
class Bar extends Foo {}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Test.groovy: 4: [Static type checking] - Cannot convert from Foo to Bar
 @ line 4, column 46.
    instanceof Bar)) ? new Bar[]{x} : null
                                 ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	62,
	"GROOVY-10129",
	"Groovy",
	"groovyc",
	"Misleading report when using as a type argument a type parameter that extends an array type",
	"https://issues.apache.org/jira/browse/GROOVY-10129",
	"soundness",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-06-08 10:49:42+00:00",
	"None",
	"Unexpected Runtime Behavior",
	"None",
	"class A<T> {}
class B {}
@groovy.transform.TypeChecked
class C<G extends B[]> extends A<G> {} // It works if G extends B",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Main.groovy: 8: unable to resolve class G
 @ line 8, column 34.
   class C<G extends B[]> extends A<G> {}
                                    ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	63,
	"GROOVY-10128",
	"Groovy",
	"groovyc",
	"Cannot assign closure with long as return type to java.util.function.Function<X, Number>",
	"https://issues.apache.org/jira/browse/GROOVY-10128",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-06-08 10:34:11+00:00",
	"2021-10-30 15:15:03+00:00",
	"Unexpected Compile-Time Error",
	"144 days, 4:40:52",
	"import java.util.function.Function;
@groovy.transform.TypeChecked
class Main {
  public static void main(String[] args) {
      Function<String, Number> x = { y ->
          final long d = 1;
          return d;
      };
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Main.groovy: 6: [Static type checking] - Incompatible generic argument types. Cannot assign java.util.function.Function <java.lang.String, java.lang.Long> to: java.util.function.Function <String, Number>
 @ line 6, column 36.
         Function<String, Number> x = { y ->
                                      ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	64,
	"GROOVY-10127",
	"Groovy",
	"groovyc",
	"STC misses type check in Generic class with a bounded type parameter",
	"https://issues.apache.org/jira/browse/GROOVY-10127",
	"soundness",
	NULL,
	NULL,
	"In Progress",
	NULL,
	"2021-06-08 10:06:18+00:00",
	"None",
	"Unexpected Runtime Behavior",
	"None",
	"public class Main {
  public static void main(String[] args) {
    new Foo<B>().foo(new B()).m()
  }
}
class A{}
class B extends A{
  void m() {}
}
@groovy.transform.TypeChecked
class Foo<T extends A> {
  T foo(T x) {
    x = new A(); // does not catch the error;
  }
}",
	"Caught: groovy.lang.MissingMethodException: No signature of method: A.m() is applicable for argument types: () values: []
Possible solutions: is(java.lang.Object), NV([Ljava.lang.Object;), any(), dump(), any(groovy.lang.Closure), tap(groovy.lang.Closure)
groovy.lang.MissingMethodException: No signature of method: A.m() is applicable for argument types: () values: []
Possible solutions: is(java.lang.Object), NV([Ljava.lang.Object;), any(), dump(), any(groovy.lang.Closure), tap(groovy.lang.Closure)
        at Main.main(Main.groovy:3)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	65,
	"GROOVY-10125",
	"Groovy",
	"groovyc",
	"FP Cycle detected in type parameter that extends another type parameter",
	"https://issues.apache.org/jira/browse/GROOVY-10125",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-06-07 11:21:58+00:00",
	"2021-06-07 19:16:42+00:00",
	"Unexpected Compile-Time Error",
	"7:54:44",
	"@groovy.transform.TypeChecked
class Test<X, Y extends X> {}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Test.groovy: 2: Cycle detected: the type java.lang.Object cannot extend/implement itself or one of its own member types
 @ line 2, column 25.
   class Test<X, Y extends X> {}
                           ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	66,
	"GROOVY-10116",
	"Groovy",
	"groovyc",
	"STC: error when passing a type parameter in type constructor",
	"https://issues.apache.org/jira/browse/GROOVY-10116",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-05-27 13:45:15+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"@groovy.transform.TypeChecked
class Test<T> {
  public void foo() {
    Foo<T, Long> x = new Foo<T, Long>(new Bar<T, Long>());
  }
}
class Foo<X, T> {
  public Foo(Bar<X, T> y) {}
}
class Bar<X, T> {}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Test.groovy: 4: [Static type checking] - Cannot call Foo#<init>(Bar<T, java.lang.Long>) with arguments [Bar<T, java.lang.Long>]
 @ line 4, column 22.
       Foo<T, Long> x = new Foo<T, Long>(new Bar<T, Long>());
                        ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	67,
	"GROOVY-10115",
	"Groovy",
	"groovyc",
	"STC: compiler error when using type parameter with extends",
	"https://issues.apache.org/jira/browse/GROOVY-10115",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-05-27 13:34:25+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"@groovy.transform.TypeChecked
class Bar<L, T extends L> {
    T x;
    public Bar(T x) {
      this.x = x;
    }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Bar.groovy: 5: [Static type checking] - Cannot assign value of type L to variable of type T
 @ line 5, column 16.
         this.x = x;
                  ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	68,
	"GROOVY-10114",
	"Groovy",
	"groovyc",
	"Wrong type argument inference when using the result of ternary operator directly.",
	"https://issues.apache.org/jira/browse/GROOVY-10114",
	"inference",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-05-27 11:35:10+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"@groovy.transform.TypeChecked
class Test {
  public static void main(String[] args) {
    def x = ((false) ? new B<>(new A()) : new B<>(new A()))
    x.bar.foo()
    ((false) ? new B<A>(new A()) : new B<>(new A())).bar.foo()
    ((false) ? new B<>(new A()) : new B<>(new A())).bar.foo()
  }
}
final class A {
  public A() {
  }
  final Character foo() {
    (Character) ''g''
  }
}
class B<V> {
  public V bar
  public B(V bar) {
    this.bar = bar
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Test.groovy: 7: [Static type checking] - Cannot find matching method java.lang.Object#foo(). Please check if the declared type is correct and if the method exists.
 @ line 7, column 5.
       ((false) ? new B<>(new A()) : new B<>(new A())).bar.foo()
       ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	69,
	"GROOVY-10113",
	"Groovy",
	"groovyc",
	"StackOverflowError in STC",
	"https://issues.apache.org/jira/browse/GROOVY-10113",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-05-27 09:29:41+00:00",
	"2021-06-06 21:20:47+00:00",
	"crash",
	"10 days, 11:51:06",
	"@groovy.transform.TypeChecked
class Test<T extends T> {}",
	">>> a serious error occurred: null
>>> stacktrace:
java.lang.StackOverflowError
  at org.codehaus.groovy.ast.ClassNode.redirect(ClassNode.java:195)
  at org.codehaus.groovy.ast.ClassNode.redirect(ClassNode.java:195)
  at org.codehaus.groovy.ast.ClassNode.redirect(ClassNode.java:195)
  at org.codehaus.groovy.ast.ClassNode.redirect(ClassNode.java:195)
  at org.codehaus.groovy.ast.ClassNode.redirect(ClassNode.java:195)
  at org.codehaus.groovy.ast.ClassNode.redirect(ClassNode.java:195)
  at org.codehaus.groovy.ast.ClassNode.redirect(ClassNode.java:195)
  at org.codehaus.groovy.ast.ClassNode.redirect(ClassNode.java:195)
  at org.codehaus.groovy.ast.ClassNode.redirect(ClassNode.java:195)
....
  at org.codehaus.groovy.ast.ClassNode.redirect(ClassNode.java:195)
  at org.codehaus.groovy.ast.ClassNode.redirect(ClassNode.java:195)
  at org.codehaus.groovy.ast.ClassNode.redirect(ClassNode.java:195)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	70,
	"GROOVY-10111",
	"Groovy",
	"groovyc",
	"compiler crash during canonicalization",
	"https://issues.apache.org/jira/browse/GROOVY-10111",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-05-26 13:11:09+00:00",
	"2021-05-26 22:23:10+00:00",
	"crash",
	"9:12:01",
	"class Foo<X, Y> {}
class Bar<X extends Foo<Number, String>> {
  X[] m() {
    new X[]{new Foo<Number, String>()}
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
General error during canonicalization: Index 1 out of bounds for length 1java.lang.ArrayIndexOutOfBoundsException: Index 1 out of bounds for length 1
        at org.codehaus.groovy.ast.GenericsType.compareGenericsWithBound(GenericsType.java:388)
        at org.codehaus.groovy.ast.GenericsType.checkGenerics(GenericsType.java:308)
        at org.codehaus.groovy.ast.GenericsType.isCompatibleWith(GenericsType.java:234)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingSupport.isAssignableTo(StaticTypeCheckingSupport.java:479)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.checkCast(StaticTypeCheckingVisitor.java:4181)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitArrayExpression(StaticTypeCheckingVisitor.java:4128)
        at org.codehaus.groovy.ast.expr.ArrayExpression.visit(ArrayExpression.java:103)
        at org.codehaus.groovy.ast.CodeVisitorSupport.visitExpressionStatement(CodeVisitorSupport.java:117)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitExpressionStatement(ClassCodeVisitorSupport.java:200)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitExpressionStatement(StaticTypeCheckingVisitor.java:2172)
        at org.codehaus.groovy.ast.stmt.ExpressionStatement.visit(ExpressionStatement.java:41)
        at org.codehaus.groovy.ast.CodeVisitorSupport.visitBlockStatement(CodeVisitorSupport.java:86)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitBlockStatement(ClassCodeVisitorSupport.java:164)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitBlockStatement(StaticTypeCheckingVisitor.java:3973)
        at org.codehaus.groovy.ast.stmt.BlockStatement.visit(BlockStatement.java:70)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitClassCodeContainer(ClassCodeVisitorSupport.java:138)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitConstructorOrMethod(ClassCodeVisitorSupport.java:111)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitConstructorOrMethod(StaticTypeCheckingVisitor.java:2161)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitMethod(ClassCodeVisitorSupport.java:106)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.startMethodInference(StaticTypeCheckingVisitor.java:2602)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitMethod(StaticTypeCheckingVisitor.java:2565)
        at org.codehaus.groovy.transform.sc.StaticCompilationVisitor.visitMethod(StaticCompilationVisitor.java:239)
        at org.codehaus.groovy.ast.ClassNode.visitMethods(ClassNode.java:1110)
        at org.codehaus.groovy.ast.ClassNode.visitContents(ClassNode.java:1103)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitClass(ClassCodeVisitorSupport.java:52)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitClass(StaticTypeCheckingVisitor.java:436)
        at org.codehaus.groovy.transform.sc.StaticCompilationVisitor.visitClass(StaticCompilationVisitor.java:197)
        at org.codehaus.groovy.transform.sc.StaticCompileTransformation.visit(StaticCompileTransformation.java:68)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:566)
        at org.codehaus.groovy.runtime.callsite.PlainObjectMetaMethodSite.doInvoke(PlainObjectMetaMethodSite.java:43)
        at org.codehaus.groovy.runtime.callsite.PojoMetaMethodSite$PojoCachedMethodSite.invoke(PojoMetaMethodSite.java:193)
        at org.codehaus.groovy.runtime.callsite.PojoMetaMethodSite.call(PojoMetaMethodSite.java:57)
        at org.codehaus.groovy.runtime.callsite.AbstractCallSite.call(AbstractCallSite.java:148)
        at org.codehaus.groovy.control.customizers.ASTTransformationCustomizer.call(ASTTransformationCustomizer.groovy:297)
        at org.codehaus.groovy.control.CompilationUnit$IPrimaryClassNodeOperation.doPhaseOperation(CompilationUnit.java:928)
        at org.codehaus.groovy.control.CompilationUnit.processPhaseOperations(CompilationUnit.java:657)
        at org.codehaus.groovy.control.CompilationUnit.compile(CompilationUnit.java:634)
        at org.codehaus.groovy.control.CompilationUnit.compile(CompilationUnit.java:609)
        at org.codehaus.groovy.tools.FileSystemCompiler.compile(FileSystemCompiler.java:311)
        at org.codehaus.groovy.tools.FileSystemCompiler.doCompilation(FileSystemCompiler.java:240)
        at org.codehaus.groovy.tools.FileSystemCompiler.commandLineCompile(FileSystemCompiler.java:165)
        at org.codehaus.groovy.tools.FileSystemCompiler.commandLineCompileWithErrorHandling(FileSystemCompiler.java:205)
        at org.codehaus.groovy.tools.FileSystemCompiler.main(FileSystemCompiler.java:189)1 error
~
❯ groovyc-l --compile-static test.groovy
org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
General error during canonicalization: Index 1 out of bounds for length 1java.lang.ArrayIndexOutOfBoundsException: Index 1 out of bounds for length 1
        at org.codehaus.groovy.ast.GenericsType.compareGenericsWithBound(GenericsType.java:388)
        at org.codehaus.groovy.ast.GenericsType.checkGenerics(GenericsType.java:308)
        at org.codehaus.groovy.ast.GenericsType.isCompatibleWith(GenericsType.java:234)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingSupport.isAssignableTo(StaticTypeCheckingSupport.java:479)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.checkCast(StaticTypeCheckingVisitor.java:4181)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitArrayExpression(StaticTypeCheckingVisitor.java:4128)
        at org.codehaus.groovy.ast.expr.ArrayExpression.visit(ArrayExpression.java:103)
        at org.codehaus.groovy.ast.CodeVisitorSupport.visitExpressionStatement(CodeVisitorSupport.java:117)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitExpressionStatement(ClassCodeVisitorSupport.java:200)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitExpressionStatement(StaticTypeCheckingVisitor.java:2172)
        at org.codehaus.groovy.ast.stmt.ExpressionStatement.visit(ExpressionStatement.java:41)
        at org.codehaus.groovy.ast.CodeVisitorSupport.visitBlockStatement(CodeVisitorSupport.java:86)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitBlockStatement(ClassCodeVisitorSupport.java:164)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitBlockStatement(StaticTypeCheckingVisitor.java:3973)
        at org.codehaus.groovy.ast.stmt.BlockStatement.visit(BlockStatement.java:70)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitClassCodeContainer(ClassCodeVisitorSupport.java:138)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitConstructorOrMethod(ClassCodeVisitorSupport.java:111)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitConstructorOrMethod(StaticTypeCheckingVisitor.java:2161)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitMethod(ClassCodeVisitorSupport.java:106)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.startMethodInference(StaticTypeCheckingVisitor.java:2602)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitMethod(StaticTypeCheckingVisitor.java:2565)
        at org.codehaus.groovy.transform.sc.StaticCompilationVisitor.visitMethod(StaticCompilationVisitor.java:239)
        at org.codehaus.groovy.ast.ClassNode.visitMethods(ClassNode.java:1110)
        at org.codehaus.groovy.ast.ClassNode.visitContents(ClassNode.java:1103)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitClass(ClassCodeVisitorSupport.java:52)
        at org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitClass(StaticTypeCheckingVisitor.java:436)
        at org.codehaus.groovy.transform.sc.StaticCompilationVisitor.visitClass(StaticCompilationVisitor.java:197)
        at org.codehaus.groovy.transform.sc.StaticCompileTransformation.visit(StaticCompileTransformation.java:68)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:566)
        at org.codehaus.groovy.runtime.callsite.PlainObjectMetaMethodSite.doInvoke(PlainObjectMetaMethodSite.java:43)
        at org.codehaus.groovy.runtime.callsite.PojoMetaMethodSite$PojoCachedMethodSite.invoke(PojoMetaMethodSite.java:193)
        at org.codehaus.groovy.runtime.callsite.PojoMetaMethodSite.call(PojoMetaMethodSite.java:57)
        at org.codehaus.groovy.runtime.callsite.AbstractCallSite.call(AbstractCallSite.java:148)
        at org.codehaus.groovy.control.customizers.ASTTransformationCustomizer.call(ASTTransformationCustomizer.groovy:297)
        at org.codehaus.groovy.control.CompilationUnit$IPrimaryClassNodeOperation.doPhaseOperation(CompilationUnit.java:928)
        at org.codehaus.groovy.control.CompilationUnit.processPhaseOperations(CompilationUnit.java:657)
        at org.codehaus.groovy.control.CompilationUnit.compile(CompilationUnit.java:634)
        at org.codehaus.groovy.control.CompilationUnit.compile(CompilationUnit.java:609)
        at org.codehaus.groovy.tools.FileSystemCompiler.compile(FileSystemCompiler.java:311)
        at org.codehaus.groovy.tools.FileSystemCompiler.doCompilation(FileSystemCompiler.java:240)
        at org.codehaus.groovy.tools.FileSystemCompiler.commandLineCompile(FileSystemCompiler.java:165)
        at org.codehaus.groovy.tools.FileSystemCompiler.commandLineCompileWithErrorHandling(FileSystemCompiler.java:205)
        at org.codehaus.groovy.tools.FileSystemCompiler.main(FileSystemCompiler.java:189)1"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	71,
	"GROOVY-10107",
	"Groovy",
	"groovyc",
	"Cannot assign null to a variable with a bounded generic type",
	"https://issues.apache.org/jira/browse/GROOVY-10107",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-05-25 13:46:59+00:00",
	"2021-06-04 15:02:54+00:00",
	"crash",
	"10 days, 1:15:55",
	"final class Test<T extends Number> {
  final void m() {
    T v = null;
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
test.groovy: 5: [Static type checking] - Cannot assign value of type <unknown parameter type> to variable of type T
 @ line 5, column 11.
       T v = null;
             ^1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	72,
	"GROOVY-10100",
	"Groovy",
	"groovyc",
	"groovyc infers the wrong type when using a method reference of a function with varargs",
	"https://issues.apache.org/jira/browse/GROOVY-10100",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-05-20 12:20:45+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"import java.util.function.Function;
class Foo<T> {
    public T method(Object... args) {
      return null;
    }
}
class Bar {
    public static <T extends Number> void test(T a) {
        Foo<T> x = new Foo<>();
        Function<String[], T> b = x::method;
        T y = b.apply(new String[] {""str""});
    }
}
public class Main {
  public static void main(String[] args) {
    Bar.test(1);
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
groovy4.groovy: 14: [Static type checking] - Cannot assign value of type java.lang.String[] to variable of type T
 @ line 14, column 15.
           T y = b.apply(new String[] {""str""});
                 ^1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	73,
	"GROOVY-10098",
	"Groovy",
	"groovyc",
	"Unexpected behaviour when the return type of a closure is a type parameter",
	"https://issues.apache.org/jira/browse/GROOVY-10098",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-05-19 18:44:17+00:00",
	"2021-05-20 18:01:13+00:00",
	"Unexpected Compile-Time Error",
	"23:16:56",
	"class Foo<T extends Number> {
  T f  Foo(T f) {
    this.f = f
  }
  T foo() {
    Closure<T> clos = { -> f}
    clos()
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
test.groovy: 10: [Static type checking] - Cannot return value of type java.lang.Object on method returning type T
 @ line 10, column 5.
       clos()
       ^1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	74,
	"GROOVY-10096",
	"Groovy",
	"groovyc",
	"STC: accepts incorrect program with flow typing",
	"https://issues.apache.org/jira/browse/GROOVY-10096",
	"soundness",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-05-19 08:37:34+00:00",
	"None",
	"Unexpected Runtime Behavior",
	"None",
	"@groovy.transform.TypeChecked
class Main {
  public static Bar buz(Foo bux) {
    (((true || bux instanceof Bar)) ?
      bux :
       new Bar())
  }
  public static void main(String[] args) {
    buz(new Foo()).bar()
  }
}
class Foo {
  public void foo() {}
}
class Bar extends Foo {
  public void bar() {}
}",
	"Caught: org.codehaus.groovy.runtime.typehandling.GroovyCastException: Cannot cast object ''Foo@2e1792e7'' with class ''Foo'' to class ''Bar''
org.codehaus.groovy.runtime.typehandling.GroovyCastException: Cannot cast object ''Foo@2e1792e7'' with class ''Foo'' to class ''Bar''
        at Main.buz(Main.groovy:6)
        at Main.main(Main.groovy:9)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	75,
	"GROOVY-10095",
	"Groovy",
	"groovyc",
	"Wrong LUB when involving a numeric constant and null",
	"https://issues.apache.org/jira/browse/GROOVY-10095",
	"soundness",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-05-18 19:09:52+00:00",
	"None",
	"Unexpected Runtime Behavior",
	"None",
	"class Foo {  void foo() {
    float x = (false) ? 10.4: null;
  }
}
public class Main {
  public static void main(String[] args) {
    new Foo().foo();
  }
}",
	"Exception in thread ""main"" org.codehaus.groovy.runtime.typehandling.GroovyCastException: Cannot cast object ''null'' with class ''null'' to class ''float''. Try ''java.lang.Float'' instead
        at org.codehaus.groovy.runtime.typehandling.DefaultTypeTransformation.castToNumber(DefaultTypeTransformation.java:175)
        at org.codehaus.groovy.runtime.typehandling.DefaultTypeTransformation.floatUnbox(DefaultTypeTransformation.java:95)
        at Foo.foo(groovy6.groovy:4)
        at Main.main(groovy6.groovy:11)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	76,
	"GROOVY-10094",
	"Groovy",
	"groovyc",
	"STC misses type checks on default arguments",
	"https://issues.apache.org/jira/browse/GROOVY-10094",
	"soundness",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-05-18 11:55:33+00:00",
	"2021-09-10 19:12:40+00:00",
	"Unexpected Runtime Behavior",
	"115 days, 7:17:07",
	"class Foo {
  void bar(int x = ""str"") {
    System.out.println(x)
  }
}
class Main {
  public static void main(String[] args) {
    (new Foo()).bar()
  } 
}",
	"Exception in thread ""main"" org.codehaus.groovy.runtime.typehandling.GroovyCastException: Cannot cast object ''fda'' with class ''java.lang.String'' to class ''int''
        at org.codehaus.groovy.runtime.typehandling.DefaultTypeTransformation.castToNumber(DefaultTypeTransformation.java:172)
        at org.codehaus.groovy.runtime.typehandling.DefaultTypeTransformation.intUnbox(DefaultTypeTransformation.java:81)
        at Foo.bar(test.groovy)
        at Main.main(test.groovy:10)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	77,
	"GROOVY-10092",
	"Groovy",
	"groovyc",
	"Compiler crash when trying to cast a boolean to float variable",
	"https://issues.apache.org/jira/browse/GROOVY-10092",
	"soundness",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-05-17 16:45:01+00:00",
	"None",
	"crash",
	"None",
	"@groovy.transform.CompileStatic
class Main {
  void foo() {
    float x = true
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
General error during canonicalization: class java.lang.Boolean cannot be cast to class java.lang.Number (java.lang.Boolean and java.lang.Number are in module java.base of loader ''bootstrap'')
java.lang.ClassCastException: class java.lang.Boolean cannot be cast to class java.lang.Number (java.lang.Boolean and java.lang.Number are in module java.base of loader ''bootstrap'')
        at org.codehaus.groovy.transform.sc.transformers.BinaryExpressionTransformer.optimizeConstantInitialization(BinaryExpressionTransformer.java:368)
        at org.codehaus.groovy.transform.sc.transformers.BinaryExpressionTransformer.transformBinaryExpression(BinaryExpressionTransformer.java:107)
        at org.codehaus.groovy.transform.sc.transformers.StaticCompilationTransformer.transform(StaticCompilationTransformer.java:113)
        at org.codehaus.groovy.ast.ClassCodeExpressionTransformer.visitExpressionStatement(ClassCodeExpressionTransformer.java:108)
        at org.codehaus.groovy.ast.stmt.ExpressionStatement.visit(ExpressionStatement.java:41)
        at org.codehaus.groovy.ast.CodeVisitorSupport.visitBlockStatement(CodeVisitorSupport.java:86)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitBlockStatement(ClassCodeVisitorSupport.java:164)
        at org.codehaus.groovy.ast.stmt.BlockStatement.visit(BlockStatement.java:70)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitClassCodeContainer(ClassCodeVisitorSupport.java:138)
        at org.codehaus.groovy.transform.sc.transformers.StaticCompilationTransformer.visitClassCodeContainer(StaticCompilationTransformer.java:104)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitConstructorOrMethod(ClassCodeVisitorSupport.java:111)
        at org.codehaus.groovy.ast.ClassCodeExpressionTransformer.visitConstructorOrMethod(ClassCodeExpressionTransformer.java:66)
        at org.codehaus.groovy.transform.sc.transformers.StaticCompilationTransformer.visitConstructorOrMethod(StaticCompilationTransformer.java:166)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitMethod(ClassCodeVisitorSupport.java:106)
        at org.codehaus.groovy.ast.ClassNode.visitMethods(ClassNode.java:1110)
        at org.codehaus.groovy.ast.ClassNode.visitContents(ClassNode.java:1103)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitClass(ClassCodeVisitorSupport.java:52)
        at org.codehaus.groovy.transform.sc.transformers.StaticCompilationTransformer.visitClass(StaticCompilationTransformer.java:153)
        at org.codehaus.groovy.transform.sc.StaticCompileTransformation.visit(StaticCompileTransformation.java:90)
        at org.codehaus.groovy.transform.ASTTransformationVisitor.visitClass(ASTTransformationVisitor.java:146)
        at org.codehaus.groovy.transform.ASTTransformationVisitor.lambda$addPhaseOperations$2(ASTTransformationVisitor.java:229)
        at org.codehaus.groovy.control.CompilationUnit$IPrimaryClassNodeOperation.doPhaseOperation(CompilationUnit.java:928)
        at org.codehaus.groovy.control.CompilationUnit.processPhaseOperations(CompilationUnit.java:657)
        at org.codehaus.groovy.control.CompilationUnit.compile(CompilationUnit.java:634)
        at org.codehaus.groovy.control.CompilationUnit.compile(CompilationUnit.java:609)
        at org.codehaus.groovy.tools.FileSystemCompiler.compile(FileSystemCompiler.java:311)
        at org.codehaus.groovy.tools.FileSystemCompiler.doCompilation(FileSystemCompiler.java:240)
        at org.codehaus.groovy.tools.FileSystemCompiler.commandLineCompile(FileSystemCompiler.java:165)
        at org.codehaus.groovy.tools.FileSystemCompiler.commandLineCompileWithErrorHandling(FileSystemCompiler.java:205)
        at org.codehaus.groovy.tools.FileSystemCompiler.main(FileSystemCompiler.java:189)
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	78,
	"GROOVY-10091",
	"Groovy",
	"groovyc",
	"Incompatible generic argument types on closure''s return type",
	"https://issues.apache.org/jira/browse/GROOVY-10091",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-05-17 13:48:42+00:00",
	"2021-05-18 19:53:24+00:00",
	"Unexpected Compile-Time Error",
	"1 day, 6:04:42",
	"class Foo<T> {}
class Bar<T> extends Foo<Integer> {}
class Baz extends Foo<Integer> {}
public class Main {
  public static void main(String[] args) {
    Closure<Foo<Integer>> z = { -> new Baz()} // this works
    Closure<Foo<Integer>> f = { -> new Bar<String>()} // this doesn''t work
  } 
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
test.groovy: 9: [Static type checking] - Incompatible generic argument types. Cannot assign groovy.lang.Closure<Bar<java.lang.String>> to: groovy.lang.Closure<Foo<java.lang.Integer>>
 @ line 9, column 31.
       Closure<Foo<Integer>> f = { -> new Bar<String>()} // this doesn''t work
                                 ^1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	79,
	"GROOVY-10087",
	"Groovy",
	"groovyc",
	"STC does not perform boxing on chars when encountering assignment and function call",
	"https://issues.apache.org/jira/browse/GROOVY-10087",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-05-13 13:01:13+00:00",
	"2021-05-16 00:19:23+00:00",
	"Unexpected Compile-Time Error",
	"2 days, 11:18:10",
	"public class Main {
    public static void main(String[] args) {
      Character c = foo();
    }
    public static char foo() {
      ''d'' as char
    }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
test.groovy: 3: [Static type checking] - Cannot assign value of type char to variable of type java.lang.Character
 @ line 3, column 21.
         Character c = foo();
                       ^1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	80,
	"GROOVY-10086",
	"Groovy",
	"groovyc",
	"STC misses type error when calling a vararg method",
	"https://issues.apache.org/jira/browse/GROOVY-10086",
	"inference/soundness",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-05-13 09:25:05+00:00",
	"2021-05-16 02:01:27+00:00",
	"Unexpected Runtime Behavior",
	"2 days, 16:36:22",
	"class Foo {}
class X<T> {
  T f;
  X(T f) {
    this.f = f;
  }
  T getF() {
    this.f;
  }
}
class A {
  void foo(int x, X<Foo>... y) {
    Foo foo = y[0].getF(); // ClastCastException at runtime
  }
}
public class Main {
    public static void main(String[] args) {
      A a = new A();
      a.foo(1, new X<>(1));
    }
}",
	"Exception in thread ""main"" org.codehaus.groovy.runtime.typehandling.GroovyCastException: Cannot cast object ''1'' with class ''java.lang.Integer'' to class ''Foo''
        at org.codehaus.groovy.runtime.typehandling.DefaultTypeTransformation.continueCastOnSAM(DefaultTypeTransformation.java:415)
        at org.codehaus.groovy.runtime.typehandling.DefaultTypeTransformation.continueCastOnNumber(DefaultTypeTransformation.java:329)
        at org.codehaus.groovy.runtime.typehandling.DefaultTypeTransformation.castToType(DefaultTypeTransformation.java:243)
        at org.codehaus.groovy.vmplugin.v8.IndyInterface.fromCache(IndyInterface.java:318)
        at A.foo(test.groovy:16)
        at Main.main(test.groovy:23)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	81,
	"GROOVY-10082",
	"Groovy",
	"groovyc",
	"Incompatible generic argument types when combining subtyping and closures",
	"https://issues.apache.org/jira/browse/GROOVY-10082",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-05-12 09:37:13+00:00",
	"2021-05-15 17:11:58+00:00",
	"Unexpected Compile-Time Error",
	"3 days, 7:34:45",
	"class A {}
class B extends A {}
class Main {
  public static void main(String[] args) {
    Closure<A> cls = { -> {
      final A x = new B()
      x
    }}
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
test.groovy: 7: [Static type checking] - Incompatible generic argument types. Cannot assign groovy.lang.Closure<B> to: groovy.lang.Closure<A>
 @ line 7, column 22.
       Closure cls = { -> {
                        ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	82,
	"GROOVY-10081",
	"Groovy",
	"groovyc",
	"Conversion from int to byte does not work in case of ternary operator",
	"https://issues.apache.org/jira/browse/GROOVY-10081",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-05-11 10:27:52+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"@groovy.transform.CompileStatic
public class Main {
  static byte x = 1;
  public static byte foo() {
    1
  }
  public static void main(String[] args) {
    x = (true) ? 0 : foo() // this does not work
    // the following works
    if (true) {
      x = 0
    } else {
      x = foo()
    }
    byte y = (true) ? 0 : foo() // this doesn''t work as well
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Main.groovy: 11: [Static type checking] - Possible loss of precision from int to byte
 @ line 11, column 9.
       x = (true) ? 0 : foo() 
           ^
Main.groovy: 20: [Static type checking] - Possible loss of precision from int to byte
 @ line 20, column 14.
       byte y = (true) ? 0 : foo() 
                ^
2 errors"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	83,
	"GROOVY-10080",
	"Groovy",
	"groovyc",
	"Closure with type argument inference does not work as expected",
	"https://issues.apache.org/jira/browse/GROOVY-10080",
	"inference",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-05-11 10:18:10+00:00",
	"2021-05-11 22:24:24+00:00",
	"Unexpected Compile-Time Error",
	"12:06:14",
	"@groovy.transform.CompileStatic
public class Main {
  public static void main(String[] args) {
    def closure = {
      new Bar<>(new Foo<Long>());
    }
    closure().f.m(new BigDecimal[0]) // this doesn''t work
    // the following works
    // Bar<Foo<Long>> x = closure()
    // x.f.m(new BigDecimal[0]);
  }
}
class Foo<X> {
  void m(Object[] x) {}
}
class Bar<X> {
  X f;
  Bar(X f) {
    this.f = f;
  }
}
class Baz {}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Main.groovy: 7: [Static type checking] - Cannot find matching method java.lang.Object#m(java.math.BigDecimal[]). Please check if the declared type is correct and if the method exists.
 @ line 7, column 5.
       closure().f.m(new BigDecimal[0]) 
       ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	84,
	"GROOVY-10079",
	"Groovy",
	"groovyc",
	"groovyc does not perform unboxing on Character type",
	"https://issues.apache.org/jira/browse/GROOVY-10079",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-05-10 10:07:31+00:00",
	"2021-05-11 23:16:57+00:00",
	"Unexpected Compile-Time Error",
	"1 day, 13:09:26",
	"public class Main {
  public static char foo() {
    return (Character) ''d'';
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
test.groovy: 4: [Static type checking] - Cannot return value of type java.lang.Character on method returning type char
 @ line 4, column 12.
       return (Character) ''d'';
              ^1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	85,
	"GROOVY-10033",
	"Groovy",
	"groovyc",
	"Compiler crash when encountering function reference on nested class",
	"https://issues.apache.org/jira/browse/GROOVY-10033",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-04-12 11:56:12+00:00",
	"2021-04-26 12:44:30+00:00",
	"crash",
	"14 days, 0:48:18",
	"class Foo {
  protected Foo(Closure<Foo, Bar> x) {}
}
class Bar {
    Bar(Foo x) {}
}
public class X extends Foo {
    public X() {
        super(Y::new);
    }
    private class Y extends Bar {
        Y(Foo x) {
            super(x);
        }
    }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
General error during instruction selection: NullPointerException while processing test.groovy. test.groovygroovy.lang.GroovyRuntimeException: NullPointerException while processing test.groovy. test.groovy
        at org.codehaus.groovy.classgen.AsmClassGenerator.visitClass(AsmClassGenerator.java:348)
        at org.codehaus.groovy.control.CompilationUnit$3.call(CompilationUnit.java:783)
        at org.codehaus.groovy.control.CompilationUnit$IPrimaryClassNodeOperation.doPhaseOperation(CompilationUnit.java:928)
        at org.codehaus.groovy.control.CompilationUnit.processPhaseOperations(CompilationUnit.java:657)
        at org.codehaus.groovy.control.CompilationUnit.compile(CompilationUnit.java:634)
        at org.codehaus.groovy.control.CompilationUnit.compile(CompilationUnit.java:609)
        at org.codehaus.groovy.tools.FileSystemCompiler.compile(FileSystemCompiler.java:311)
        at org.codehaus.groovy.tools.FileSystemCompiler.doCompilation(FileSystemCompiler.java:240)
        at org.codehaus.groovy.tools.FileSystemCompiler.commandLineCompile(FileSystemCompiler.java:165)
        at org.codehaus.groovy.tools.FileSystemCompiler.commandLineCompileWithErrorHandling(FileSystemCompiler.java:205)
        at org.codehaus.groovy.tools.FileSystemCompiler.main(FileSystemCompiler.java:189)
Caused by: java.lang.NullPointerException
        at org.codehaus.groovy.classgen.asm.sc.StaticTypesMethodReferenceExpressionWriter.createParametersWithExactType(StaticTypesMethodReferenceExpressionWriter.java:255)
        at org.codehaus.groovy.classgen.asm.sc.StaticTypesMethodReferenceExpressionWriter.writeMethodReferenceExpression(StaticTypesMethodReferenceExpressionWriter.java:97)
        at org.codehaus.groovy.classgen.AsmClassGenerator.visitMethodReferenceExpression(AsmClassGenerator.java:844)
        at org.codehaus.groovy.ast.expr.MethodReferenceExpression.visit(MethodReferenceExpression.java:34)
        at org.codehaus.groovy.classgen.asm.sc.StaticInvocationWriter.visitArgument(StaticInvocationWriter.java:517)
        at org.codehaus.groovy.classgen.asm.sc.StaticInvocationWriter.loadArguments(StaticInvocationWriter.java:464)
        at org.codehaus.groovy.classgen.asm.sc.StaticInvocationWriter.writeSpecialConstructorCall(StaticInvocationWriter.java:212)
        at org.codehaus.groovy.classgen.AsmClassGenerator.visitConstructorCallExpression(AsmClassGenerator.java:917)
        at org.codehaus.groovy.ast.expr.ConstructorCallExpression.visit(ConstructorCallExpression.java:45)
        at org.codehaus.groovy.classgen.asm.StatementWriter.writeExpressionStatement(StatementWriter.java:602)
        at org.codehaus.groovy.classgen.AsmClassGenerator.visitExpressionStatement(AsmClassGenerator.java:744)
        at org.codehaus.groovy.ast.stmt.ExpressionStatement.visit(ExpressionStatement.java:41)
        at org.codehaus.groovy.classgen.asm.StatementWriter.writeBlockStatement(StatementWriter.java:92)
        at org.codehaus.groovy.classgen.asm.sc.StaticTypesStatementWriter.writeBlockStatement(StaticTypesStatementWriter.java:78)
        at org.codehaus.groovy.classgen.AsmClassGenerator.visitBlockStatement(AsmClassGenerator.java:675)
        at org.codehaus.groovy.ast.stmt.BlockStatement.visit(BlockStatement.java:70)
        at org.codehaus.groovy.classgen.AsmClassGenerator.visitStdMethod(AsmClassGenerator.java:516)
        at org.codehaus.groovy.classgen.AsmClassGenerator.visitConstructorOrMethod(AsmClassGenerator.java:461)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitConstructor(ClassCodeVisitorSupport.java:101)
        at org.codehaus.groovy.classgen.AsmClassGenerator.visitConstructor(AsmClassGenerator.java:608)
        at org.codehaus.groovy.ast.ClassNode.visitContents(ClassNode.java:1097)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitClass(ClassCodeVisitorSupport.java:52)
        at org.codehaus.groovy.classgen.AsmClassGenerator.visitClass(AsmClassGenerator.java:325)
        ... 10 more1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	86,
	"GROOVY-10011",
	"Groovy",
	"groovyc",
	"Combining flow typing and type argument inference does not work as expected",
	"https://issues.apache.org/jira/browse/GROOVY-10011",
	"inference",
	NULL,
	NULL,
	"Closed",
	"Fixed",
	"2021-04-05 19:48:59+00:00",
	"2021-04-10 22:16:23+00:00",
	"Unexpected Compile-Time Error",
	"5 days, 2:27:24",
	"class A<T> {
  T f;
  public A(T f) {
    this.f = f;
  }
}
class Foo {}
class Bar extends Foo {}
public class Main {
  public static void bar(Foo x) {
    if (x instanceof Bar) {
      A<Bar> a = new A<>(x)
    }
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
test.groovy: 15: [Static type checking] - Incompatible generic argument types. Cannot assign A <Foo> to: A <Bar>
 @ line 15, column 18.
         A<Bar> a = new A<>(x)
                    ^1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	87,
	"GROOVY-9996",
	"Groovy",
	"groovyc",
	"Cannot infer correct type argument when using subtyping",
	"https://issues.apache.org/jira/browse/GROOVY-9996",
	"inference",
	NULL,
	NULL,
	"Closed",
	"Fixed",
	"2021-03-22 08:36:14+00:00",
	"2021-03-25 00:32:28+00:00",
	"Unexpected Compile-Time Error",
	"2 days, 15:56:14",
	"@groovy.transform.CompileStatic
public class Main {
  public static void main(String[] args) {
    Foo foo = new Bar()
    def x = new A<>(foo)
    bar(x)
  }
  public static void bar(A<Foo> f) {}
}
class A<T> {
  T f;
  public A(T f) {
    this.f = f;
  }
}
class Foo {}
class Bar extends Foo {}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Main.groovy: 6: [Static type checking] - Cannot call Main#bar(A <Foo>) with arguments [A <Bar>]
 @ line 6, column 5.
       bar(x)
       ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	88,
	"GROOVY-9995",
	"Groovy",
	"groovyc",
	"Wrong inference inside closure when having a bounded type parameter",
	"https://issues.apache.org/jira/browse/GROOVY-9995",
	"inference",
	NULL,
	NULL,
	"Closed",
	"Fixed",
	"2021-03-22 08:24:14+00:00",
	"2021-03-24 14:45:48+00:00",
	"Unexpected Compile-Time Error",
	"2 days, 6:21:34",
	"@groovy.transform.CompileStatic
public class Main {
  public static void main(String[] args) {
    Closure<A<Long>> closure =  { -> {
      final x = (Long) 1;
      new A<>(x);
    }}
    // If I remove ''extends Number'' in class A, the following code
    // works as expected.
    final Long y = closure().f;
  }
}
class A<T extends Number> {
  T f;
  public A(T f) {
    this.f = f;
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Main.groovy: 10: [Static type checking] - Cannot assign value of type java.lang.Number to variable of type java.lang.Long
 @ line 10, column 20.
       final Long y = closure().f;
                      ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	89,
	"GROOVY-9994",
	"Groovy",
	"groovyc",
	"Type checking of array initializer expressions",
	"https://issues.apache.org/jira/browse/GROOVY-9994",
	"soundness",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-03-21 14:45:50+00:00",
	"2021-05-26 22:22:57+00:00",
	"Unexpected Runtime Behavior",
	"66 days, 7:37:07",
	"public class Main {
  public static void main(String[] args) {
    Integer[] arr = new Integer[] {new Object(), 1}; // STC misses the error here
    Integer y = arr[0]; // ClassCastException at runtime
  }
}",
	"public class Main {
  public static void main(String[] args) {
    Integer[] arr = new Integer[] {new Object(), 1}; // STC misses the error here
    Integer y = arr[0]; // ClassCastException at runtime
  }
}"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	90,
	"GROOVY-9986",
	"Groovy",
	"groovyc",
	"CLONE - STC does not report type mismatches for coerced list expression",
	"https://issues.apache.org/jira/browse/GROOVY-9986",
	"soundness",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-03-17 06:54:43+00:00",
	"None",
	"Unexpected Runtime Behavior",
	"None",
	"public class Main {
    public static void main(String[] args) {
      // Integer[] arr = new Integer[]{1, ""str""}; // does not report error (see GROOVY-9985)
      Integer[] arr2 = [1, ""fda""] as Integer[] // does not report error
    }
}",
	"Exception in thread ""main"" org.codehaus.groovy.runtime.typehandling.GroovyCastException: Cannot cast object ''str'' with class ''java.lang.String'' to class ''java.lang.Integer''
        at org.codehaus.groovy.runtime.typehandling.DefaultTypeTransformation.castToNumber(DefaultTypeTransformation.java:172)
        at org.codehaus.groovy.runtime.typehandling.DefaultTypeTransformation.continueCastOnNumber(DefaultTypeTransformation.java:282)
        at org.codehaus.groovy.runtime.typehandling.DefaultTypeTransformation.castToType(DefaultTypeTransformation.java:243)
        at org.codehaus.groovy.vmplugin.v8.IndyInterface.fromCache(IndyInterface.java:318)
        at Main.main(test.groovy:4)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	91,
	"GROOVY-9985",
	"Groovy",
	"groovyc",
	"STC does not report type mismatches in array initializers",
	"https://issues.apache.org/jira/browse/GROOVY-9985",
	"soundness",
	NULL,
	NULL,
	"Closed",
	"Fixed",
	"2021-03-15 10:13:37+00:00",
	"2021-03-18 04:17:21+00:00",
	"Unexpected Runtime Behavior",
	"2 days, 18:03:44",
	"public class Main {
    public static void main(String[] args) {
      Integer[] arr = new Integer[]{1, ""str""}; // does not report error
      // Integer[] arr2 = [1, ""fda""] as Integer[] // does not report error (see GROOVY-9986)
    }
}",
	"Exception in thread ""main"" org.codehaus.groovy.runtime.typehandling.GroovyCastException: Cannot cast object ''str'' with class ''java.lang.String'' to class ''java.lang.Integer''
        at org.codehaus.groovy.runtime.typehandling.DefaultTypeTransformation.castToNumber(DefaultTypeTransformation.java:172)
        at org.codehaus.groovy.runtime.typehandling.DefaultTypeTransformation.continueCastOnNumber(DefaultTypeTransformation.java:282)
        at org.codehaus.groovy.runtime.typehandling.DefaultTypeTransformation.castToType(DefaultTypeTransformation.java:243)
        at org.codehaus.groovy.vmplugin.v8.IndyInterface.fromCache(IndyInterface.java:318)
        at Main.main(test.groovy:4)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	92,
	"GROOVY-9984",
	"Groovy",
	"groovyc",
	"Wrong type inference when passing null",
	"https://issues.apache.org/jira/browse/GROOVY-9984",
	"inference",
	NULL,
	NULL,
	"Closed",
	"Fixed",
	"2021-03-15 09:50:57+00:00",
	"2021-03-21 15:09:10+00:00",
	"Unexpected Compile-Time Error",
	"6 days, 5:18:13",
	"@groovy.transform.CompileStatic
public class Main {
  public static void main(String[] args) {
    final A<Integer> x = new A<>(null);
    baz(x);
  }
  public static void baz(A<Integer> x) {}
}
class A<T> {
  T f;
  public A(T f) {
    this.f = f;
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Test.groovy: 4: [Static type checking] - Incompatible generic argument types. Cannot assign A <java.lang.Object> to: A <Integer>
 @ line 4, column 26.
       final A<Integer> x = new A<>(null);
                            ^
Test.groovy: 5: [Static type checking] - Cannot call Main#baz(A <java.lang.Integer>) with arguments [A <java.lang.Object>]
 @ line 5, column 5.
       baz(x);
       ^
2 errors"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	93,
	"GROOVY-9983",
	"Groovy",
	"groovyc",
	"Type argument inference does not work in ternary operator",
	"https://issues.apache.org/jira/browse/GROOVY-9983",
	"inference",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-03-15 09:36:19+00:00",
	"2021-05-16 19:00:41+00:00",
	"Unexpected Compile-Time Error",
	"62 days, 9:24:22",
	"@groovy.transform.CompileStatic
public class Test {
  public static void main(String[] args) {
      final A<B> x = (true ? new A<>(new B()): new A<>(new C()))
      bar(x) // compiles
      bar((true ? new A<>(new B()): new A<>(new C()))) // does not compile
  }
  public static void bar(A<B> x) {}
}
class A<T> {
  T f;
  public A(T f) {
    this.f = f;
  }
}
class B {}
class C extends B{}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Test.groovy: 6: [Static type checking] - Cannot call Test#bar(A <B>) with arguments [A <? extends B>]
 @ line 6, column 7.
         bar((true ? new A<>(new B()): new A<>(new C())))
         ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	94,
	"GROOVY-9979",
	"Groovy",
	"groovyc",
	"Inconsistency in handling of numeric types",
	"https://issues.apache.org/jira/browse/GROOVY-9979",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-03-11 14:21:15+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"public class Main {
  public static void foo() {
    final Byte f = (Float) 32.3 // possible loss of precision
    baz((Float) 13.3) // cannot find matching method
  }
  public static Byte bar() {
    return (Float) 4324141.4 // does not report error.
  }
  public static void baz(Byte x) {}
}",
	"test.groovy: 4: [Static type checking] - Possible loss of precision from java.lang.Float to java.lang.Byte
 @ line 4, column 20.
       final Byte f = (Float) 32.3 // possible loss of precision
                      ^1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	95,
	"GROOVY-9972",
	"Groovy",
	"groovyc",
	"LUB does not work correctly in case of ternary operator",
	"https://issues.apache.org/jira/browse/GROOVY-9972",
	"inference",
	NULL,
	NULL,
	"Closed",
	"Fixed",
	"2021-03-08 14:53:09+00:00",
	"2021-03-15 13:35:46+00:00",
	"Unexpected Compile-Time Error",
	"6 days, 22:42:37",
	"class Foo {
  public String x = ""f"";
}
class A<T> {
  public T f;
  A(T f) {
    this.f = f;
  }
}
public class Main {
  public static void foo() {
    def temp;
    if (true) {
      temp = new A<>(new Foo());
    } else {
      temp = new A<>(new Foo());
    }
    temp.f.x.toLowerCase() // works  fine
  }
  public static void bar() {
    A<Foo> temp = true ? new A<>(new Foo()) : new A<>(new Foo())
    temp.f.x // does not compile;
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
test.groovy: 26: [Static type checking] - No such property: x for class: java.lang.Object
 @ line 26, column 5.
       temp.f.x // does not compile;
       ^1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	96,
	"GROOVY-9970",
	"Groovy",
	"groovyc",
	"Type argument inference does not work in closure",
	"https://issues.apache.org/jira/browse/GROOVY-9970",
	"inference",
	NULL,
	NULL,
	"Closed",
	"Fixed",
	"2021-03-08 08:31:59+00:00",
	"2021-03-15 13:35:26+00:00",
	"Unexpected Compile-Time Error",
	"7 days, 5:03:27",
	"class Foo {}
final class A<T extends Foo> {
  public T x;
  A(T x) {
    this.x = x;
  }
}
@groovy.transform.CompileStatic
public class C<T extends Number> {
  public void foo(T args) {
    final A<Foo> x = new A<>(new Foo()); // compiles
    def closure = p -> {
        final A<Foo> y = new A<>(new Foo()); // does not compile
    }
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Foo.groovy: 15: [Static type checking] - Cannot call A#<init>(T) with arguments [Foo]
 @ line 15, column 26.
           final A<Foo> y = new A<>(new Foo()); 
                            ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	97,
	"GROOVY-9967",
	"Groovy",
	"groovyc",
	"STC: Access to field/property is forbidden after instanceof.",
	"https://issues.apache.org/jira/browse/GROOVY-9967",
	"generator",
	NULL,
	NULL,
	"Closed",
	"Fixed",
	"2021-03-05 09:30:07+00:00",
	"2021-03-07 02:37:14+00:00",
	"Unexpected Compile-Time Error",
	"1 day, 17:07:07",
	"class Test {
  static void main(String[] args) {
    println(C.func4(new B()))
  }
}
class A {}
class B extends A {
  // It has the same behavior if f is a field instead of a property.
  String f = ""foo""
}
@groovy.transform.CompileStatic
class C {
  static String func1(Object x) {
    (x instanceof String) ? x : ""foo"" // Compiles
  }
  static String func2(B x) {
    x.f // Compiles
  }
  static String func3(B x) {
    (x instanceof B) ? x.f : ""foo"" // Compiles
  }
  static String func4(A x) {
    (x instanceof B) ? x.f : ""foo"" // Does not compile
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Test.groovy: 28: Access to A#f is forbidden @ line 28, column 24.
       (x instanceof B) ? x.f : ""foo"" 
                          ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	98,
	"GROOVY-9963",
	"Groovy",
	"groovyc",
	"Generic type of field is not istantiated",
	"https://issues.apache.org/jira/browse/GROOVY-9963",
	"inference",
	NULL,
	NULL,
	"Closed",
	"Fixed",
	"2021-03-03 21:32:51+00:00",
	"2021-03-07 01:34:16+00:00",
	"Unexpected Compile-Time Error",
	"3 days, 4:01:25",
	"class A<T> {
  T x;
  A(T x) {
    this.x = x;
  }
}
public class Main {
  public static void main(String[] args) {
    bar((new A<>("""")).x);
  }
  public static void bar(String x) {}
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
test.groovy: 11: [Static type checking] - Cannot find matching method Main#bar(T). Please check if the declared type is correct and if the method exists.
 @ line 11, column 5.
       bar((new A<>("""")).x);
       ^1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	99,
	"GROOVY-9960",
	"Groovy",
	"groovyc",
	"STC fails to report missing constructor",
	"https://issues.apache.org/jira/browse/GROOVY-9960",
	"soundness",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-03-01 15:13:45+00:00",
	"None",
	"Unexpected Runtime Behavior",
	"None",
	"class A {
  String x;
  public A(String x) {
    this.x = x;
  }
}
class B extends A {}
public class Main {
  public static void main(String[] args) {
    B x = new B();
  }
}",
	"Exception in thread ""main"" java.lang.NoSuchMethodError: A: method ''void <init>()'' not found
        at B.<init>(test.groovy)
        at Main.main(test.groovy:13)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	100,
	"GROOVY-9956",
	"Groovy",
	"groovyc",
	"Cannot infer correct type argument when passing a subtype of the declared type argument",
	"https://issues.apache.org/jira/browse/GROOVY-9956",
	"inference",
	NULL,
	NULL,
	"Closed",
	"Fixed",
	"2021-02-26 17:05:46+00:00",
	"2021-03-03 00:24:20+00:00",
	"Unexpected Compile-Time Error",
	"4 days, 7:18:34",
	"class Foo<T> {
    T f;
    Foo (T f) {
      this.f = f;
    }
}
interface Bar{}
class Baz<T> implements Bar {}
@groovy.transform.TypeChecked
class Main  {
  public static void main(String[] args) {
    Foo<Bar> x1 = new Foo<Bar>(new Baz<Integer>()) // Compiles
    Foo<Bar> x2 = new Foo<>(new Baz<Integer>()) // Does not compile
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Main.groovy: 16: [Static type checking] - Incompatible generic argument types. Cannot assign Foo <Baz> to: Foo <Bar>
 @ line 16, column 19.
       Foo<Bar> x2 = new Foo<>(new Baz<Integer>())
                     ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	101,
	"GROOVY-9953",
	"Groovy",
	"groovyc",
	"Type from flow typing is not propagated in variable assignments",
	"https://issues.apache.org/jira/browse/GROOVY-9953",
	"inference",
	NULL,
	NULL,
	"Closed",
	"Fixed",
	"2021-02-24 18:57:09+00:00",
	"2021-03-02 14:58:20+00:00",
	"Unexpected Compile-Time Error",
	"5 days, 20:01:11",
	"class A {}
@groovy.transform.CompileStatic
class Main {
  static A bar(Object x) {
    if (x instanceof A) {
      def y = x // Inferred Object and not A
      y
    } else {
      new A()
    }
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Main.groovy: 9: [Static type checking] - Cannot return value of type java.lang.Object on method returning type A
 @ line 9, column 7.
         y
         ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	102,
	"GROOVY-9952",
	"Groovy",
	"groovyc",
	"STC does not correctly type check variable whose type is a type variable",
	"https://issues.apache.org/jira/browse/GROOVY-9952",
	"soundness",
	NULL,
	NULL,
	"In Progress",
	NULL,
	"2021-02-22 16:45:02+00:00",
	"None",
	"Unexpected Runtime Behavior",
	"None",
	"class Y {}
class X<T> {
    T x;
    public X() {
      this.x = new Y()
    }
    T foo() { return this.x }
}
class Main {
  public static void main(String[] args) {
    bar(new X<Integer>());
  }
  public static Integer bar(X<Integer> y) {
    return y.foo()
  }
}",
	"Exception in thread ""main"" org.codehaus.groovy.runtime.typehandling.GroovyCastException: Cannot cast object ''Y@57175e74'' with class ''Y'' to class ''java.lang.Integer''
        at org.codehaus.groovy.runtime.typehandling.DefaultTypeTransformation.castToNumber(DefaultTypeTransformation.java:175)
        at org.codehaus.groovy.runtime.typehandling.DefaultTypeTransformation.continueCastOnNumber(DefaultTypeTransformation.java:282)
        at org.codehaus.groovy.runtime.typehandling.DefaultTypeTransformation.castToType(DefaultTypeTransformation.java:243)
        at org.codehaus.groovy.vmplugin.v8.IndyInterface.fromCache(IndyInterface.java:318)
        at Main.bar(groovy1.groovy:19)
        at Main.main(groovy1.groovy:15)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	103,
	"GROOVY-9948",
	"Groovy",
	"groovyc",
	"Cannot infer the right type in the presence of diamond operator",
	"https://issues.apache.org/jira/browse/GROOVY-9948",
	"inference",
	NULL,
	NULL,
	"Closed",
	"Fixed",
	"2021-02-17 14:17:46+00:00",
	"2021-03-02 14:59:59+00:00",
	"Unexpected Compile-Time Error",
	"13 days, 0:42:13",
	"class Foo<T> {
    T f;
    Foo (T f) {
      this.f = f;
    }
}
class Main  {
  public static void main(String[] args) {
      Foo<Integer> x = new Foo<>(1);
      assert x.f < 10 == true; // does not compile
      m(x);
  }  public static void m(Foo<Integer> x) {
      assert x.f < 10 == true; // compiles fine
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Test.groovy: 11: [Static type checking] - Cannot find matching method java.lang.Object#compareTo(int). Please check if the declared type is correct and if the method exists.
 @ line 11, column 14.
         assert x.f < 10 == true;
                ^1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	104,
	"GROOVY-9947",
	"Groovy",
	"groovyc",
	"Cannot pass numeric constant to a method with a generic type",
	"https://issues.apache.org/jira/browse/GROOVY-9947",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-02-16 16:37:51+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"@groovy.transform.TypeChecked
class Main {
  public static final void main(String[] args) {
    final A<Float> a = new A<Float>()
    a.foo(10)
    a.bar(10) // Fails here
  }
}
final class A<T> {
  final void foo(Float x) {}
  final void bar(T x) {}
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Main.groovy: 6: [Static type checking] - Cannot call A <Float>#bar(java.lang.Float) with arguments [int]
 @ line 6, column 5.
       a.bar(10)
       ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	105,
	"GROOVY-9945",
	"Groovy",
	"groovyc",
	"STC: Cannot find matching method when using Generics",
	"https://issues.apache.org/jira/browse/GROOVY-9945",
	"generator",
	NULL,
	NULL,
	"Closed",
	"Fixed",
	"2021-02-16 07:08:51+00:00",
	"2021-03-02 15:00:25+00:00",
	"Unexpected Compile-Time Error",
	"14 days, 7:51:34",
	"interface I1<X, Y> {}
interface I2 extends I1<Character, Character> {}
class Foo<X, Y> implements I2 {
  public void foo(X x, Y y) {}
}
class Bar<X, Y> extends Foo<X, Y> {}
@groovy.transform.TypeChecked
class Main {
  public static void foo() {
    new Bar<Float, Integer>().foo((Float) 1.4, -1)
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Main.groovy: 14: [Static type checking] - Cannot find matching method Bar#foo(java.lang.Float, java.lang.Integer). Please check if the declared type is correct and if the method exists.
 @ line 14, column 5.
       new Bar<Float, Integer>().foo((Float) 1.4, -1)
       ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	106,
	"GROOVY-9937",
	"Groovy",
	"groovyc",
	"internal compiler error during instruction selection",
	"https://issues.apache.org/jira/browse/GROOVY-9937",
	"soundness",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-02-11 20:18:07+00:00",
	"None",
	"crash",
	"None",
	"class Foo {
  static void foo() {
    return 1   
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
General error during instruction selection: Cannot use return statement with an expression on a method that returns void
. At [3:5] Main.groovyorg.codehaus.groovy.syntax.RuntimeParserException: Cannot use return statement with an expression on a method that returns void
. At [3:5] Main.groovy
        at org.codehaus.groovy.classgen.AsmClassGenerator.throwException(AsmClassGenerator.java:2185)
        at org.codehaus.groovy.classgen.asm.StatementWriter.writeReturn(StatementWriter.java:605)
        at org.codehaus.groovy.classgen.AsmClassGenerator.visitReturnStatement(AsmClassGenerator.java:681)
        at org.codehaus.groovy.ast.stmt.ReturnStatement.visit(ReturnStatement.java:73)
        at org.codehaus.groovy.classgen.asm.StatementWriter.writeBlockStatement(StatementWriter.java:94)
        at org.codehaus.groovy.classgen.asm.sc.StaticTypesStatementWriter.writeBlockStatement(StaticTypesStatementWriter.java:78)
        at org.codehaus.groovy.classgen.AsmClassGenerator.visitBlockStatement(AsmClassGenerator.java:617)
        at org.codehaus.groovy.ast.stmt.BlockStatement.visit(BlockStatement.java:69)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitClassCodeContainer(ClassCodeVisitorSupport.java:138)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitConstructorOrMethod(ClassCodeVisitorSupport.java:111)
        at org.codehaus.groovy.classgen.AsmClassGenerator.visitStdMethod(AsmClassGenerator.java:461)
        at org.codehaus.groovy.classgen.AsmClassGenerator.visitConstructorOrMethod(AsmClassGenerator.java:408)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitMethod(ClassCodeVisitorSupport.java:106)
        at org.codehaus.groovy.classgen.AsmClassGenerator.visitMethod(AsmClassGenerator.java:556)
        at org.codehaus.groovy.ast.ClassNode.visitMethods(ClassNode.java:1099)
        at org.codehaus.groovy.ast.ClassNode.visitContents(ClassNode.java:1092)
        at org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitClass(ClassCodeVisitorSupport.java:52)
        at org.codehaus.groovy.classgen.AsmClassGenerator.visitClass(AsmClassGenerator.java:271)
        at org.codehaus.groovy.control.CompilationUnit$3.call(CompilationUnit.java:797)
        at org.codehaus.groovy.control.CompilationUnit$IPrimaryClassNodeOperation.doPhaseOperation(CompilationUnit.java:942)
        at org.codehaus.groovy.control.CompilationUnit.processPhaseOperations(CompilationUnit.java:671)
        at org.codehaus.groovy.control.CompilationUnit.compile(CompilationUnit.java:635)
        at org.codehaus.groovy.control.CompilationUnit.compile(CompilationUnit.java:610)
        at org.codehaus.groovy.tools.FileSystemCompiler.compile(FileSystemCompiler.java:311)
        at org.codehaus.groovy.tools.FileSystemCompiler.doCompilation(FileSystemCompiler.java:240)
        at org.codehaus.groovy.tools.FileSystemCompiler.commandLineCompile(FileSystemCompiler.java:165)
        at org.codehaus.groovy.tools.FileSystemCompiler.commandLineCompileWithErrorHandling(FileSystemCompiler.java:205)
        at org.codehaus.groovy.tools.FileSystemCompiler.main(FileSystemCompiler.java:189)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:566)
        at org.codehaus.groovy.tools.GroovyStarter.rootLoader(GroovyStarter.java:111)
        at org.codehaus.groovy.tools.GroovyStarter.main(GroovyStarter.java:129)1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	107,
	"GROOVY-9935",
	"Groovy",
	"groovyc",
	"int reference seems to not use its wrapper class",
	"https://issues.apache.org/jira/browse/GROOVY-9935",
	"inference",
	NULL,
	NULL,
	"Closed",
	"Fixed",
	"2021-02-10 14:00:04+00:00",
	"2021-03-02 15:02:49+00:00",
	"Unexpected Compile-Time Error",
	"20 days, 1:02:45",
	"@groovy.transform.TypeChecked
class Foo {
  static Number foo() {
    def i = 10  // If I use: `Integer i = 10` it works
    return i
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Test.groovy: 5: [Static type checking] - Cannot return value of type int on method returning type java.lang.Number
 @ line 5, column 12.
       return i
              ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	108,
	"GROOVY-9934",
	"Groovy",
	"groovyc",
	"Bounded type parameter is not captured by closure",
	"https://issues.apache.org/jira/browse/GROOVY-9934",
	"inference",
	NULL,
	NULL,
	"Closed",
	"Fixed",
	"2021-02-09 10:18:19+00:00",
	"2021-03-02 15:04:52+00:00",
	"Unexpected Compile-Time Error",
	"21 days, 4:46:33",
	"class Bar {}
class Foo<T extends Bar> {
  public T method(T x) {
    def bar = {x}
    return bar()
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Main.groovy: 6: [Static type checking] - Cannot return value of type java.lang.Object on method returning type T
 @ line 6, column 12.
       return bar()
              ^1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	109,
	"GROOVY-9931",
	"Groovy",
	"groovyc",
	"!instanceof inference does not work",
	"https://issues.apache.org/jira/browse/GROOVY-9931",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-02-08 09:17:14+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"@groovy.transform.CompileStatic
class Main {
    static Integer bar(Object o) {
        if (o !instanceof Integer) {
            return 0
        } else {
            return o
        }
    }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
Main.groovy: 7: [Static type checking] - Cannot return value of type java.lang.Object on method returning type java.lang.Integer
 @ line 7, column 9.
           o
           ^
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	110,
	"GROOVY-9907",
	"Groovy",
	"groovyc",
	"Type tracked from instanceof condition is not captured in closure",
	"https://issues.apache.org/jira/browse/GROOVY-9907",
	"inference",
	NULL,
	NULL,
	"Closed",
	"Fixed",
	"2021-01-25 15:14:31+00:00",
	"2021-03-02 15:12:58+00:00",
	"Unexpected Compile-Time Error",
	"35 days, 23:58:27",
	"@groovy.transform.TypeChecked
class Test {
  public static void main(String[] args) {
    println(foo(10));
  }
  static Integer foo(Object x) {
    if (x instanceof Integer) {
      def bar = {x};
      return bar();
    }
    return 100;
  }
}",
	"org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
program.groovy: 10: [Static type checking] - Cannot return value of type java.lang.Object on method returning type java.lang.Integer
 @ line 10, column 14.
         return bar();
                ^1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	111,
	"KT-49583",
	"Kotlin",
	"kotlinc",
	"NI: NullPointerException on compiling anonymous function returning a method reference",
	"https://youtrack.jetbrains.com/issue/KT-49583",
	"generator",
	NULL,
	NULL,
	"Submitted",
	NULL,
	"2021-11-06 09:21:17.625000",
	"None",
	"crash",
	"None",
	"class Foo(var pickaxe: Function0<Function1<Char, Any>>)
interface I {
  fun m(): Int
}
fun test() {
  val x = Foo({ -> fun (p: Char): Any {
      fun inner_m(): Any {
        val x: I = TODO()
        x::m
      }
      return inner_m()
     }}
  )
}",
	"stacktrace
exception: org.jetbrains.kotlin.backend.common.BackendException: Backend Internal error: Exception during psi2ir
File being compiled: (11,9) in program.kt
The root cause java.lang.NullPointerException was thrown at: org.jetbrains.kotlin.psi2ir.generators.ReflectionReferencesGenerator.generateCallableReference(ReflectionReferencesGenerator.kt:70)
null: KtCallableReferenceExpression:
x::m
  at org.jetbrains.kotlin.backend.common.CodegenUtil.reportBackendException(CodegenUtil.kt:239)
  at org.jetbrains.kotlin.psi2ir.generators.DeclarationGenerator.generateMemberDeclaration(DeclarationGenerator.kt:75)
  at org.jetbrains.kotlin.psi2ir.generators.ModuleGenerator.generateSingleFile(ModuleGenerator.kt:83)
  at org.jetbrains.kotlin.psi2ir.generators.ModuleGenerator.generateModuleFragment(ModuleGenerator.kt:50)
  at org.jetbrains.kotlin.psi2ir.Psi2IrTranslator.generateModuleFragment(Psi2IrTranslator.kt:79)
  at org.jetbrains.kotlin.backend.jvm.JvmIrCodegenFactory.convertToIr(JvmIrCodegenFactory.kt:146)
  at org.jetbrains.kotlin.backend.jvm.JvmIrCodegenFactory.convertToIr$default(JvmIrCodegenFactory.kt:64)
  at org.jetbrains.kotlin.backend.jvm.JvmIrCodegenFactory.generateModule(JvmIrCodegenFactory.kt:59)
  at org.jetbrains.kotlin.codegen.KotlinCodegenFacade.compileCorrectFiles(KotlinCodegenFacade.java:35)
  at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.generate(KotlinToJVMBytecodeCompiler.kt:321)
  at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli(KotlinToJVMBytecodeCompiler.kt:113)
  at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli$default(KotlinToJVMBytecodeCompiler.kt:56)
  at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:169)
  at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:52)
  at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:92)
  at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:44)
  at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:98)
  at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:76)
  at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:45)
  at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit(CLITool.kt:227)
  at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit$default(CLITool.kt:222)
  at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMain(CLITool.kt:214)
  at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler$Companion.main(K2JVMCompiler.kt:271)
  at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.main(K2JVMCompiler.kt)
  at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
  at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)
  at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
  at java.base/java.lang.reflect.Method.invoke(Method.java:568)
  at org.jetbrains.kotlin.preloading.Preloader.run(Preloader.java:87)
  at org.jetbrains.kotlin.preloading.Preloader.main(Preloader.java:44)
Caused by: java.lang.NullPointerException
  at org.jetbrains.kotlin.psi2ir.generators.ReflectionReferencesGenerator.generateCallableReference(ReflectionReferencesGenerator.kt:70)
  at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.visitCallableReferenceExpression(StatementGenerator.kt:502)
  at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.visitCallableReferenceExpression(StatementGenerator.kt:54)
  at org.jetbrains.kotlin.psi.KtCallableReferenceExpression.accept(KtCallableReferenceExpression.java:43)
  at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.generateStatement(StatementGenerator.kt:70)
  at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.generateStatements(StatementGenerator.kt:80)
  at org.jetbrains.kotlin.psi2ir.generators.BodyGenerator.generateFunctionBody(BodyGenerator.kt:59)
  at org.jetbrains.kotlin.psi2ir.generators.FunctionGenerator.generateFunctionDeclaration(FunctionGenerator.kt:53)
  at org.jetbrains.kotlin.psi2ir.generators.LocalFunctionGenerator.generateFunctionDeclaration(LocalFunctionGenerator.kt:57)
  at org.jetbrains.kotlin.psi2ir.generators.LocalFunctionGenerator.generateFunction(LocalFunctionGenerator.kt:44)
  at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.visitNamedFunction(StatementGenerator.kt:483)
  at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.visitNamedFunction(StatementGenerator.kt:54)
  at org.jetbrains.kotlin.psi.KtNamedFunction.accept(KtNamedFunction.java:51)
  at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.generateStatement(StatementGenerator.kt:70)
  at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.generateStatements(StatementGenerator.kt:80)
  at org.jetbrains.kotlin.psi2ir.generators.BodyGenerator.generateFunctionBody(BodyGenerator.kt:59)
  at org.jetbrains.kotlin.psi2ir.generators.FunctionGenerator.generateFunctionDeclaration(FunctionGenerator.kt:53)
  at org.jetbrains.kotlin.psi2ir.generators.LocalFunctionGenerator.generateFunctionDeclaration(LocalFunctionGenerator.kt:57)
  at org.jetbrains.kotlin.psi2ir.generators.LocalFunctionGenerator.generateFunction(LocalFunctionGenerator.kt:44)
  at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.visitNamedFunction(StatementGenerator.kt:483)
  at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.visitNamedFunction(StatementGenerator.kt:54)
  at org.jetbrains.kotlin.psi.KtNamedFunction.accept(KtNamedFunction.java:51)
  at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.generateStatement(StatementGenerator.kt:70)
  at org.jetbrains.kotlin.psi2ir.generators.BodyGenerator.generateLambdaBody(BodyGenerator.kt:101)
  at org.jetbrains.kotlin.psi2ir.generators.FunctionGenerator.generateLambdaFunctionDeclaration(FunctionGenerator.kt:63)
  at org.jetbrains.kotlin.psi2ir.generators.LocalFunctionGenerator.generateLambda(LocalFunctionGenerator.kt:33)
  at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.visitLambdaExpression(StatementGenerator.kt:480)
  at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.visitLambdaExpression(StatementGenerator.kt:54)
  at org.jetbrains.kotlin.psi.KtLambdaExpression.accept(KtLambdaExpression.java:40)
  at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.generateStatement(StatementGenerator.kt:70)
  at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.generateExpression(StatementGenerator.kt:83)
  at org.jetbrains.kotlin.psi2ir.generators.ArgumentsGenerationUtilsKt$pregenerateCall$1.invoke(ArgumentsGenerationUtils.kt:427)
  at org.jetbrains.kotlin.psi2ir.generators.ArgumentsGenerationUtilsKt$pregenerateCall$1.invoke(ArgumentsGenerationUtils.kt:427)
  at org.jetbrains.kotlin.psi2ir.generators.ArgumentsGenerationUtilsKt.generateValueArgumentUsing(ArgumentsGenerationUtils.kt:296)
  at org.jetbrains.kotlin.psi2ir.generators.ArgumentsGenerationUtilsKt.pregenerateValueArgumentsUsing(ArgumentsGenerationUtils.kt:665)
  at org.jetbrains.kotlin.psi2ir.generators.ArgumentsGenerationUtilsKt.pregenerateCallUsing(ArgumentsGenerationUtils.kt:437)
  at org.jetbrains.kotlin.psi2ir.generators.ArgumentsGenerationUtilsKt.pregenerateCall(ArgumentsGenerationUtils.kt:427)
  at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.visitCallExpression(StatementGenerator.kt:365)
  at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.visitCallExpression(StatementGenerator.kt:54)
  at org.jetbrains.kotlin.psi.KtCallExpression.accept(KtCallExpression.java:35)
  at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.generateStatement(StatementGenerator.kt:70)
  at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.generateExpression(StatementGenerator.kt:83)
  at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.visitProperty(StatementGenerator.kt:120)
  at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.visitProperty(StatementGenerator.kt:54)
  at org.jetbrains.kotlin.psi.KtProperty.accept(KtProperty.java:58)
  at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.generateStatement(StatementGenerator.kt:70)
  at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.generateStatements(StatementGenerator.kt:80)
  at org.jetbrains.kotlin.psi2ir.generators.BodyGenerator.generateFunctionBody(BodyGenerator.kt:59)
  at org.jetbrains.kotlin.psi2ir.generators.FunctionGenerator.generateFunctionDeclaration(FunctionGenerator.kt:53)
  at org.jetbrains.kotlin.psi2ir.generators.FunctionGenerator.generateFunctionDeclaration$default(FunctionGenerator.kt:43)
  at org.jetbrains.kotlin.psi2ir.generators.DeclarationGenerator.generateMemberDeclaration(DeclarationGenerator.kt:49)
  ... 28 more"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	112,
	"KT-48765",
	"Kotlin",
	"kotlinc",
	"NI: Inferred type does not respect the bound of type variable",
	"https://youtrack.jetbrains.com/issue/KT-48765",
	"inference/soundness",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-09-15 07:55:39.756000",
	"None",
	"Unexpected Runtime Behavior",
	"None",
	"open class A<T1, T2> {}
class B {
    fun <T1: Number, T2: A<Float, T1>> foo(x1: T2, x2: T1) {}
}
class C<T: D, T2>(val x: T, val y: T2) {
    fun test() {
        B().foo(x, foo())
    }
}
open class D: A<Float, Number>()
fun <T: String> foo(): T  {
    return """" as T // this cast is safe because String is final.
}
fun main() {
    C(D(), 10.5).test()
}",
	"Exception in thread ""main"" java.lang.ClassCastException: class java.lang.String cannot be cast to class java.lang.Number (java.lang.String and java.lang.Number are in module java.base of loader ''bootstrap'')
        at C.test(kotlin6.kt:9)
        at Kotlin6Kt.main(kotlin6.kt:21)
        at Kotlin6Kt.main(kotlin6.kt)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	113,
	"KT-49101",
	"Kotlin",
	"kotlinc",
	"IllegalArgumentException: ClassicTypeSystemContext couldn''t handle: Captured(out Number)",
	"https://youtrack.jetbrains.com/issue/KT-49101",
	"soundness",
	NULL,
	NULL,
	"Closed",
	"Fixed",
	"2021-10-06 07:26:15.005000",
	"2021-10-20 14:54:38.856000",
	"crash",
	"14 days, 7:28:23.851000",
	"class A<T: B<out Number>>(val x: T) {
    fun test() {
      val y: Int = x.m<C<out Number>>()
    }
}
class B<T1> {
    fun <X1: C<T1>> m(): Int = 1
}
class C<T>",
	"stacktrace
ERROR: Exception while analyzing expression at (3,20) in test.kt
org.jetbrains.kotlin.utils.KotlinExceptionWithAttachments: Exception while analyzing expression at (3,20) in test.kt
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.logOrThrowException(ExpressionTypingVisitorDispatcher.java:246)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.lambda$getTypeInfo$0(ExpressionTypingVisitorDispatcher.java:224)
        at org.jetbrains.kotlin.util.PerformanceCounter.time(PerformanceCounter.kt:101)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:164)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:134)
        at org.jetbrains.kotlin.resolve.LocalVariableResolver.process(LocalVariableResolver.kt:112)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorForStatements.visitProperty(ExpressionTypingVisitorForStatements.java:116)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorForStatements.visitProperty(ExpressionTypingVisitorForStatements.java:67)
        at org.jetbrains.kotlin.psi.KtProperty.accept(KtProperty.java:58)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.lambda$getTypeInfo$0(ExpressionTypingVisitorDispatcher.java:175)
        at org.jetbrains.kotlin.util.PerformanceCounter.time(PerformanceCounter.kt:101)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:164)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:147)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getTypeOfLastExpressionInBlock(ExpressionTypingServices.java:402)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getBlockReturnedTypeWithWritableScope(ExpressionTypingServices.java:327)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getBlockReturnedType(ExpressionTypingServices.java:206)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getBlockReturnedType(ExpressionTypingServices.java:183)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorForStatements.visitBlockExpression(ExpressionTypingVisitorForStatements.java:479)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorForStatements.visitBlockExpression(ExpressionTypingVisitorForStatements.java:67)
        at org.jetbrains.kotlin.psi.KtBlockExpression.accept(KtBlockExpression.java:79)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.lambda$getTypeInfo$0(ExpressionTypingVisitorDispatcher.java:175)
        at org.jetbrains.kotlin.util.PerformanceCounter.time(PerformanceCounter.kt:101)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:164)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:147)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.checkFunctionReturnType(ExpressionTypingServices.java:178)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.checkFunctionReturnType(ExpressionTypingServices.java:165)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveFunctionBody(BodyResolver.java:1037)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveFunctionBody(BodyResolver.java:982)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveFunctionBodies(BodyResolver.java:967)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveBehaviorDeclarationBodies(BodyResolver.java:127)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveBodies(BodyResolver.java:254)
        at org.jetbrains.kotlin.resolve.LazyTopDownAnalyzer.analyzeDeclarations(LazyTopDownAnalyzer.kt:227)
        at org.jetbrains.kotlin.resolve.LazyTopDownAnalyzer.analyzeDeclarations$default(LazyTopDownAnalyzer.kt:58)
        at org.jetbrains.kotlin.cli.jvm.compiler.TopDownAnalyzerFacadeForJVM.analyzeFilesWithJavaIntegration(TopDownAnalyzerFacadeForJVM.kt:127)
        at org.jetbrains.kotlin.cli.jvm.compiler.TopDownAnalyzerFacadeForJVM.analyzeFilesWithJavaIntegration$default(TopDownAnalyzerFacadeForJVM.kt:86)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler$analyze$1.invoke(KotlinToJVMBytecodeCompiler.kt:252)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler$analyze$1.invoke(KotlinToJVMBytecodeCompiler.kt:243)
        at org.jetbrains.kotlin.cli.common.messages.AnalyzerWithCompilerReport.analyzeAndReport(AnalyzerWithCompilerReport.kt:113)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.analyze(KotlinToJVMBytecodeCompiler.kt:243)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli(KotlinToJVMBytecodeCompiler.kt:90)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli$default(KotlinToJVMBytecodeCompiler.kt:56)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:169)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:52)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:92)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:44)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:98)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:76)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:45)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit(CLITool.kt:227)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit$default(CLITool.kt:222)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMain(CLITool.kt:214)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler$Companion.main(K2JVMCompiler.kt:271)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.main(K2JVMCompiler.kt)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:566)
        at org.jetbrains.kotlin.preloading.Preloader.run(Preloader.java:87)
        at org.jetbrains.kotlin.preloading.Preloader.main(Preloader.java:44)
Caused by: java.lang.IllegalArgumentException: ClassicTypeSystemContext couldn''t handle: Captured(out Number), class org.jetbrains.kotlin.resolve.calls.inference.CapturedType
        at org.jetbrains.kotlin.types.checker.ClassicTypeSystemContext$DefaultImpls.captureStatus(ClassicTypeSystemContext.kt:476)
        at org.jetbrains.kotlin.resolve.calls.components.ClassicTypeSystemContextForCS.captureStatus(ClassicTypeSystemContextForCS.kt:25)
        at org.jetbrains.kotlin.resolve.calls.inference.model.NewConstraintSystemImpl.captureStatus(NewConstraintSystemImpl.kt)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext.captureStatus(ConstraintInjector.kt)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext.isCapturedTypeFromSubtyping(ConstraintInjector.kt:312)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext.access$isCapturedTypeFromSubtyping(ConstraintInjector.kt:220)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext$addNewIncorporatedConstraint$2.invoke(ConstraintInjector.kt:376)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext$addNewIncorporatedConstraint$2.invoke(ConstraintInjector.kt:376)
        at org.jetbrains.kotlin.types.TypeUtils.contains(TypeUtils.java:451)
        at org.jetbrains.kotlin.types.TypeUtils.contains(TypeUtils.java:482)
        at org.jetbrains.kotlin.types.TypeUtils.contains(TypeUtils.java:428)
        at org.jetbrains.kotlin.types.typeUtil.TypeUtilsKt.contains(TypeUtils.kt:184)
        at org.jetbrains.kotlin.types.checker.ClassicTypeSystemContextKt.containsInternal(ClassicTypeSystemContext.kt:821)
        at org.jetbrains.kotlin.types.checker.ClassicTypeSystemContextKt.access$containsInternal(ClassicTypeSystemContext.kt:1)
        at org.jetbrains.kotlin.types.checker.ClassicTypeSystemContext$DefaultImpls.contains(ClassicTypeSystemContext.kt:337)
        at org.jetbrains.kotlin.resolve.calls.components.ClassicTypeSystemContextForCS.contains(ClassicTypeSystemContextForCS.kt:25)
        at org.jetbrains.kotlin.resolve.calls.inference.model.NewConstraintSystemImpl.contains(NewConstraintSystemImpl.kt)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext.contains(ConstraintInjector.kt)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext.addNewIncorporatedConstraint(ConstraintInjector.kt:376)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext.addConstraint(ConstraintInjector.kt:328)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext.addConstraint$default(ConstraintInjector.kt:319)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext.addUpperConstraint(ConstraintInjector.kt:300)
        at org.jetbrains.kotlin.resolve.calls.inference.components.AbstractTypeCheckerContextForConstraintSystem.simplifyUpperConstraint(AbstractTypeCheckerContextForConstraintSystem.kt:276)
        at org.jetbrains.kotlin.resolve.calls.inference.components.AbstractTypeCheckerContextForConstraintSystem.internalAddSubtypeConstraint(AbstractTypeCheckerContextForConstraintSystem.kt:121)
        at org.jetbrains.kotlin.resolve.calls.inference.components.AbstractTypeCheckerContextForConstraintSystem.addSubtypeConstraint(AbstractTypeCheckerContextForConstraintSystem.kt:81)
        at org.jetbrains.kotlin.types.AbstractTypeChecker.completeIsSubTypeOf(AbstractTypeChecker.kt:255)
        at org.jetbrains.kotlin.types.AbstractTypeChecker.isSubtypeOf(AbstractTypeChecker.kt:217)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext.runIsSubtypeOf$isSubtypeOf(ConstraintInjector.kt:269)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext.runIsSubtypeOf(ConstraintInjector.kt:276)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext.runIsSubtypeOf$default(ConstraintInjector.kt:262)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector.addSubTypeConstraintAndIncorporateIt(ConstraintInjector.kt:91)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector.addInitialSubtypeConstraint(ConstraintInjector.kt:51)
        at org.jetbrains.kotlin.resolve.calls.inference.model.NewConstraintSystemImpl.addSubtypeConstraint(NewConstraintSystemImpl.kt:162)
        at org.jetbrains.kotlin.resolve.calls.components.CreateFreshVariablesSubstitutor.createToFreshVariableSubstitutorAndAddInitialConstraints$addSubtypeConstraint(ResolutionParts.kt:234)
        at org.jetbrains.kotlin.resolve.calls.components.CreateFreshVariablesSubstitutor.createToFreshVariableSubstitutorAndAddInitialConstraints(ResolutionParts.kt:243)
        at org.jetbrains.kotlin.resolve.calls.components.CreateFreshVariablesSubstitutor.process(ResolutionParts.kt:122)
        at org.jetbrains.kotlin.resolve.calls.model.KotlinResolutionCandidate.processPart(ResolutionCandidate.kt:148)
        at org.jetbrains.kotlin.resolve.calls.model.KotlinResolutionCandidate.processPart$default(ResolutionCandidate.kt:144)
        at org.jetbrains.kotlin.resolve.calls.model.KotlinResolutionCandidate.processParts(ResolutionCandidate.kt:135)
        at org.jetbrains.kotlin.resolve.calls.model.KotlinResolutionCandidate.isSuccessful(ResolutionCandidate.kt:162)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver$SuccessfulResultCollector.pushCandidates(TowerResolver.kt:363)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver.processTowerData(TowerResolver.kt:293)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver.access$processTowerData(TowerResolver.kt:80)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver$Task.process(TowerResolver.kt:161)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver$Task.run(TowerResolver.kt:180)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver.run(TowerResolver.kt:99)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver.runResolve(TowerResolver.kt:86)
        at org.jetbrains.kotlin.resolve.calls.KotlinCallResolver.resolveCall(KotlinCallResolver.kt:75)
        at org.jetbrains.kotlin.resolve.calls.tower.PSICallResolver.runResolutionAndInference(PSICallResolver.kt:101)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.doResolveCallOrGetCachedResults(CallResolver.java:601)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.lambda$computeTasksAndResolveCall$0(CallResolver.java:213)
        at org.jetbrains.kotlin.util.PerformanceCounter.time(PerformanceCounter.kt:101)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.computeTasksAndResolveCall(CallResolver.java:211)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.computeTasksAndResolveCall(CallResolver.java:199)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.resolveFunctionCall(CallResolver.java:329)
        at org.jetbrains.kotlin.resolve.calls.CallExpressionResolver.getResolvedCallForFunction(CallExpressionResolver.kt:88)
        at org.jetbrains.kotlin.resolve.calls.CallExpressionResolver.getCallExpressionTypeInfoWithoutFinalTypeCheck(CallExpressionResolver.kt:210)
        at org.jetbrains.kotlin.resolve.calls.CallExpressionResolver.getUnsafeSelectorTypeInfo(CallExpressionResolver.kt:334)
        at org.jetbrains.kotlin.resolve.calls.CallExpressionResolver.getSafeOrUnsafeSelectorTypeInfo(CallExpressionResolver.kt:377)
        at org.jetbrains.kotlin.resolve.calls.CallExpressionResolver.getQualifiedExpressionTypeInfo(CallExpressionResolver.kt:474)
        at org.jetbrains.kotlin.types.expressions.BasicExpressionTypingVisitor.visitQualifiedExpression(BasicExpressionTypingVisitor.java:702)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.visitQualifiedExpression(ExpressionTypingVisitorDispatcher.java:383)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher$ForBlock.visitQualifiedExpression(ExpressionTypingVisitorDispatcher.java:59)
        at org.jetbrains.kotlin.psi.KtVisitor.visitDotQualifiedExpression(KtVisitor.java:302)
        at org.jetbrains.kotlin.psi.KtDotQualifiedExpression.accept(KtDotQualifiedExpression.kt:32)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.lambda$getTypeInfo$0(ExpressionTypingVisitorDispatcher.java:175)
        ... 57 more
exception: org.jetbrains.kotlin.util.KotlinFrontEndException: Exception while analyzing expression at (3,20) in test.kt
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.logOrThrowException(ExpressionTypingVisitorDispatcher.java:253)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.lambda$getTypeInfo$0(ExpressionTypingVisitorDispatcher.java:224)
        at org.jetbrains.kotlin.util.PerformanceCounter.time(PerformanceCounter.kt:101)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:164)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:134)
        at org.jetbrains.kotlin.resolve.LocalVariableResolver.process(LocalVariableResolver.kt:112)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorForStatements.visitProperty(ExpressionTypingVisitorForStatements.java:116)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorForStatements.visitProperty(ExpressionTypingVisitorForStatements.java:67)
        at org.jetbrains.kotlin.psi.KtProperty.accept(KtProperty.java:58)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.lambda$getTypeInfo$0(ExpressionTypingVisitorDispatcher.java:175)
        at org.jetbrains.kotlin.util.PerformanceCounter.time(PerformanceCounter.kt:101)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:164)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:147)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getTypeOfLastExpressionInBlock(ExpressionTypingServices.java:402)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getBlockReturnedTypeWithWritableScope(ExpressionTypingServices.java:327)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getBlockReturnedType(ExpressionTypingServices.java:206)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getBlockReturnedType(ExpressionTypingServices.java:183)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorForStatements.visitBlockExpression(ExpressionTypingVisitorForStatements.java:479)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorForStatements.visitBlockExpression(ExpressionTypingVisitorForStatements.java:67)
        at org.jetbrains.kotlin.psi.KtBlockExpression.accept(KtBlockExpression.java:79)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.lambda$getTypeInfo$0(ExpressionTypingVisitorDispatcher.java:175)
        at org.jetbrains.kotlin.util.PerformanceCounter.time(PerformanceCounter.kt:101)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:164)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:147)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.checkFunctionReturnType(ExpressionTypingServices.java:178)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.checkFunctionReturnType(ExpressionTypingServices.java:165)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveFunctionBody(BodyResolver.java:1037)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveFunctionBody(BodyResolver.java:982)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveFunctionBodies(BodyResolver.java:967)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveBehaviorDeclarationBodies(BodyResolver.java:127)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveBodies(BodyResolver.java:254)
        at org.jetbrains.kotlin.resolve.LazyTopDownAnalyzer.analyzeDeclarations(LazyTopDownAnalyzer.kt:227)
        at org.jetbrains.kotlin.resolve.LazyTopDownAnalyzer.analyzeDeclarations$default(LazyTopDownAnalyzer.kt:58)
        at org.jetbrains.kotlin.cli.jvm.compiler.TopDownAnalyzerFacadeForJVM.analyzeFilesWithJavaIntegration(TopDownAnalyzerFacadeForJVM.kt:127)
        at org.jetbrains.kotlin.cli.jvm.compiler.TopDownAnalyzerFacadeForJVM.analyzeFilesWithJavaIntegration$default(TopDownAnalyzerFacadeForJVM.kt:86)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler$analyze$1.invoke(KotlinToJVMBytecodeCompiler.kt:252)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler$analyze$1.invoke(KotlinToJVMBytecodeCompiler.kt:243)
        at org.jetbrains.kotlin.cli.common.messages.AnalyzerWithCompilerReport.analyzeAndReport(AnalyzerWithCompilerReport.kt:113)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.analyze(KotlinToJVMBytecodeCompiler.kt:243)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli(KotlinToJVMBytecodeCompiler.kt:90)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli$default(KotlinToJVMBytecodeCompiler.kt:56)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:169)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:52)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:92)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:44)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:98)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:76)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:45)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit(CLITool.kt:227)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit$default(CLITool.kt:222)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMain(CLITool.kt:214)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler$Companion.main(K2JVMCompiler.kt:271)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.main(K2JVMCompiler.kt)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:566)
        at org.jetbrains.kotlin.preloading.Preloader.run(Preloader.java:87)
        at org.jetbrains.kotlin.preloading.Preloader.main(Preloader.java:44)
Caused by: java.lang.IllegalArgumentException: ClassicTypeSystemContext couldn''t handle: Captured(out Number), class org.jetbrains.kotlin.resolve.calls.inference.CapturedType
        at org.jetbrains.kotlin.types.checker.ClassicTypeSystemContext$DefaultImpls.captureStatus(ClassicTypeSystemContext.kt:476)
        at org.jetbrains.kotlin.resolve.calls.components.ClassicTypeSystemContextForCS.captureStatus(ClassicTypeSystemContextForCS.kt:25)
        at org.jetbrains.kotlin.resolve.calls.inference.model.NewConstraintSystemImpl.captureStatus(NewConstraintSystemImpl.kt)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext.captureStatus(ConstraintInjector.kt)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext.isCapturedTypeFromSubtyping(ConstraintInjector.kt:312)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext.access$isCapturedTypeFromSubtyping(ConstraintInjector.kt:220)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext$addNewIncorporatedConstraint$2.invoke(ConstraintInjector.kt:376)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext$addNewIncorporatedConstraint$2.invoke(ConstraintInjector.kt:376)
        at org.jetbrains.kotlin.types.TypeUtils.contains(TypeUtils.java:451)
        at org.jetbrains.kotlin.types.TypeUtils.contains(TypeUtils.java:482)
        at org.jetbrains.kotlin.types.TypeUtils.contains(TypeUtils.java:428)
        at org.jetbrains.kotlin.types.typeUtil.TypeUtilsKt.contains(TypeUtils.kt:184)
        at org.jetbrains.kotlin.types.checker.ClassicTypeSystemContextKt.containsInternal(ClassicTypeSystemContext.kt:821)
        at org.jetbrains.kotlin.types.checker.ClassicTypeSystemContextKt.access$containsInternal(ClassicTypeSystemContext.kt:1)
        at org.jetbrains.kotlin.types.checker.ClassicTypeSystemContext$DefaultImpls.contains(ClassicTypeSystemContext.kt:337)
        at org.jetbrains.kotlin.resolve.calls.components.ClassicTypeSystemContextForCS.contains(ClassicTypeSystemContextForCS.kt:25)
        at org.jetbrains.kotlin.resolve.calls.inference.model.NewConstraintSystemImpl.contains(NewConstraintSystemImpl.kt)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext.contains(ConstraintInjector.kt)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext.addNewIncorporatedConstraint(ConstraintInjector.kt:376)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext.addConstraint(ConstraintInjector.kt:328)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext.addConstraint$default(ConstraintInjector.kt:319)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext.addUpperConstraint(ConstraintInjector.kt:300)
        at org.jetbrains.kotlin.resolve.calls.inference.components.AbstractTypeCheckerContextForConstraintSystem.simplifyUpperConstraint(AbstractTypeCheckerContextForConstraintSystem.kt:276)
        at org.jetbrains.kotlin.resolve.calls.inference.components.AbstractTypeCheckerContextForConstraintSystem.internalAddSubtypeConstraint(AbstractTypeCheckerContextForConstraintSystem.kt:121)
        at org.jetbrains.kotlin.resolve.calls.inference.components.AbstractTypeCheckerContextForConstraintSystem.addSubtypeConstraint(AbstractTypeCheckerContextForConstraintSystem.kt:81)
        at org.jetbrains.kotlin.types.AbstractTypeChecker.completeIsSubTypeOf(AbstractTypeChecker.kt:255)
        at org.jetbrains.kotlin.types.AbstractTypeChecker.isSubtypeOf(AbstractTypeChecker.kt:217)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext.runIsSubtypeOf$isSubtypeOf(ConstraintInjector.kt:269)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext.runIsSubtypeOf(ConstraintInjector.kt:276)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector$TypeCheckerContext.runIsSubtypeOf$default(ConstraintInjector.kt:262)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector.addSubTypeConstraintAndIncorporateIt(ConstraintInjector.kt:91)
        at org.jetbrains.kotlin.resolve.calls.inference.components.ConstraintInjector.addInitialSubtypeConstraint(ConstraintInjector.kt:51)
        at org.jetbrains.kotlin.resolve.calls.inference.model.NewConstraintSystemImpl.addSubtypeConstraint(NewConstraintSystemImpl.kt:162)
        at org.jetbrains.kotlin.resolve.calls.components.CreateFreshVariablesSubstitutor.createToFreshVariableSubstitutorAndAddInitialConstraints$addSubtypeConstraint(ResolutionParts.kt:234)
        at org.jetbrains.kotlin.resolve.calls.components.CreateFreshVariablesSubstitutor.createToFreshVariableSubstitutorAndAddInitialConstraints(ResolutionParts.kt:243)
        at org.jetbrains.kotlin.resolve.calls.components.CreateFreshVariablesSubstitutor.process(ResolutionParts.kt:122)
        at org.jetbrains.kotlin.resolve.calls.model.KotlinResolutionCandidate.processPart(ResolutionCandidate.kt:148)
        at org.jetbrains.kotlin.resolve.calls.model.KotlinResolutionCandidate.processPart$default(ResolutionCandidate.kt:144)
        at org.jetbrains.kotlin.resolve.calls.model.KotlinResolutionCandidate.processParts(ResolutionCandidate.kt:135)
        at org.jetbrains.kotlin.resolve.calls.model.KotlinResolutionCandidate.isSuccessful(ResolutionCandidate.kt:162)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver$SuccessfulResultCollector.pushCandidates(TowerResolver.kt:363)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver.processTowerData(TowerResolver.kt:293)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver.access$processTowerData(TowerResolver.kt:80)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver$Task.process(TowerResolver.kt:161)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver$Task.run(TowerResolver.kt:180)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver.run(TowerResolver.kt:99)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver.runResolve(TowerResolver.kt:86)
        at org.jetbrains.kotlin.resolve.calls.KotlinCallResolver.resolveCall(KotlinCallResolver.kt:75)
        at org.jetbrains.kotlin.resolve.calls.tower.PSICallResolver.runResolutionAndInference(PSICallResolver.kt:101)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.doResolveCallOrGetCachedResults(CallResolver.java:601)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.lambda$computeTasksAndResolveCall$0(CallResolver.java:213)
        at org.jetbrains.kotlin.util.PerformanceCounter.time(PerformanceCounter.kt:101)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.computeTasksAndResolveCall(CallResolver.java:211)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.computeTasksAndResolveCall(CallResolver.java:199)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.resolveFunctionCall(CallResolver.java:329)
        at org.jetbrains.kotlin.resolve.calls.CallExpressionResolver.getResolvedCallForFunction(CallExpressionResolver.kt:88)
        at org.jetbrains.kotlin.resolve.calls.CallExpressionResolver.getCallExpressionTypeInfoWithoutFinalTypeCheck(CallExpressionResolver.kt:210)
        at org.jetbrains.kotlin.resolve.calls.CallExpressionResolver.getUnsafeSelectorTypeInfo(CallExpressionResolver.kt:334)
        at org.jetbrains.kotlin.resolve.calls.CallExpressionResolver.getSafeOrUnsafeSelectorTypeInfo(CallExpressionResolver.kt:377)
        at org.jetbrains.kotlin.resolve.calls.CallExpressionResolver.getQualifiedExpressionTypeInfo(CallExpressionResolver.kt:474)
        at org.jetbrains.kotlin.types.expressions.BasicExpressionTypingVisitor.visitQualifiedExpression(BasicExpressionTypingVisitor.java:702)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.visitQualifiedExpression(ExpressionTypingVisitorDispatcher.java:383)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher$ForBlock.visitQualifiedExpression(ExpressionTypingVisitorDispatcher.java:59)
        at org.jetbrains.kotlin.psi.KtVisitor.visitDotQualifiedExpression(KtVisitor.java:302)
        at org.jetbrains.kotlin.psi.KtDotQualifiedExpression.accept(KtDotQualifiedExpression.kt:32)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.lambda$getTypeInfo$0(ExpressionTypingVisitorDispatcher.java:175)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	114,
	"KT-45118",
	"Kotlin",
	"kotlinc",
	"ClassCastException caused by parent and child class in if-else",
	"https://youtrack.jetbrains.com/issue/KT-45118",
	"inference",
	NULL,
	NULL,
	"Closed",
	"Fixed",
	"2021-02-22 21:19:42.862000",
	"2021-09-29 20:10:53.588000",
	"crash",
	"218 days, 22:51:10.726000",
	"open class Foo(open val x: Boolean)
class Bar: Foo(false)
fun contract(x: Foo) =
  x
val temp = if (true) contract(Bar()) else Bar()",
	"stacktrace
ERROR: Exception while analyzing expression at at offset: 0 file: KtFile: program.kt
org.jetbrains.kotlin.utils.KotlinExceptionWithAttachments: Exception while analyzing expression at at offset: 0 file: KtFile: program.kt
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.logOrThrowException(ExpressionTypingVisitorDispatcher.java:246)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.lambda$getTypeInfo$0(ExpressionTypingVisitorDispatcher.java:224)
        at org.jetbrains.kotlin.util.PerformanceCounter.time(PerformanceCounter.kt:101)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:164)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:134)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getTypeInfo(ExpressionTypingServices.java:124)
        at org.jetbrains.kotlin.resolve.calls.tower.PSICallResolver.resolveValueArgument(PSICallResolver.kt:769)
        at org.jetbrains.kotlin.resolve.calls.tower.PSICallResolver.resolveArgumentsInParenthesis(PSICallResolver.kt:706)
        at org.jetbrains.kotlin.resolve.calls.tower.PSICallResolver.toKotlinCall(PSICallResolver.kt:584)
        at org.jetbrains.kotlin.resolve.calls.tower.PSICallResolver.runResolutionAndInferenceForGivenCandidates(PSICallResolver.kt:130)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.doResolveCallOrGetCachedResults(CallResolver.java:605)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.lambda$resolveCallWithKnownCandidate$4(CallResolver.java:582)
        at org.jetbrains.kotlin.util.PerformanceCounter.time(PerformanceCounter.kt:101)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.resolveCallWithKnownCandidate(CallResolver.java:572)
        at org.jetbrains.kotlin.types.expressions.ControlStructureTypingUtils.resolveSpecialConstructionAsCall(ControlStructureTypingUtils.java:167)
        at org.jetbrains.kotlin.types.expressions.ControlStructureTypingUtils.resolveSpecialConstructionAsCall(ControlStructureTypingUtils.java:124)
        at org.jetbrains.kotlin.types.expressions.ControlStructureTypingVisitor.visitIfExpression(ControlStructureTypingVisitor.java:120)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.visitIfExpression(ExpressionTypingVisitorDispatcher.java:289)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher$ForDeclarations.visitIfExpression(ExpressionTypingVisitorDispatcher.java:46)
        at org.jetbrains.kotlin.psi.KtIfExpression.accept(KtIfExpression.java:33)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.lambda$getTypeInfo$0(ExpressionTypingVisitorDispatcher.java:175)
        at org.jetbrains.kotlin.util.PerformanceCounter.time(PerformanceCounter.kt:101)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:164)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:134)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:146)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getTypeInfo(ExpressionTypingServices.java:119)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getTypeInfo(ExpressionTypingServices.java:94)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getType(ExpressionTypingServices.java:136)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.safeGetType(ExpressionTypingServices.java:79)
        at org.jetbrains.kotlin.resolve.VariableTypeAndInitializerResolver.resolveInitializerType(VariableTypeAndInitializerResolver.kt:171)
        at org.jetbrains.kotlin.resolve.VariableTypeAndInitializerResolver.access$resolveInitializerType(VariableTypeAndInitializerResolver.kt:26)
        at org.jetbrains.kotlin.resolve.VariableTypeAndInitializerResolver$resolveTypeNullable$1.invoke(VariableTypeAndInitializerResolver.kt:91)
        at org.jetbrains.kotlin.resolve.VariableTypeAndInitializerResolver$resolveTypeNullable$1.invoke(VariableTypeAndInitializerResolver.kt:26)
        at org.jetbrains.kotlin.storage.LockBasedStorageManager$LockBasedLazyValue.invoke(LockBasedStorageManager.java:375)
        at org.jetbrains.kotlin.storage.LockBasedStorageManager$LockBasedNotNullLazyValue.invoke(LockBasedStorageManager.java:494)
        at org.jetbrains.kotlin.types.DeferredType.getDelegate(DeferredType.java:107)
        at org.jetbrains.kotlin.resolve.BodyResolver.computeDeferredType(BodyResolver.java:1015)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveProperty(BodyResolver.java:756)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolvePropertyDeclarationBodies(BodyResolver.java:802)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveBehaviorDeclarationBodies(BodyResolver.java:119)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveBodies(BodyResolver.java:246)
        at org.jetbrains.kotlin.resolve.LazyTopDownAnalyzer.analyzeDeclarations(LazyTopDownAnalyzer.kt:225)
        at org.jetbrains.kotlin.resolve.LazyTopDownAnalyzer.analyzeDeclarations$default(LazyTopDownAnalyzer.kt:60)
        at org.jetbrains.kotlin.cli.jvm.compiler.TopDownAnalyzerFacadeForJVM.analyzeFilesWithJavaIntegration(TopDownAnalyzerFacadeForJVM.kt:123)
        at org.jetbrains.kotlin.cli.jvm.compiler.TopDownAnalyzerFacadeForJVM.analyzeFilesWithJavaIntegration$default(TopDownAnalyzerFacadeForJVM.kt:93)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler$analyze$1.invoke(KotlinToJVMBytecodeCompiler.kt:557)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler$analyze$1.invoke(KotlinToJVMBytecodeCompiler.kt:83)
        at org.jetbrains.kotlin.cli.common.messages.AnalyzerWithCompilerReport.analyzeAndReport(AnalyzerWithCompilerReport.kt:115)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.analyze(KotlinToJVMBytecodeCompiler.kt:548)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli(KotlinToJVMBytecodeCompiler.kt:192)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli$default(KotlinToJVMBytecodeCompiler.kt:162)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:169)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:52)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:88)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:44)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:98)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:76)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:45)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit(CLITool.kt:227)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit$default(CLITool.kt:225)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMain(CLITool.kt:214)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler$Companion.main(K2JVMCompiler.kt:271)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.main(K2JVMCompiler.kt)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:566)
        at org.jetbrains.kotlin.preloading.Preloader.run(Preloader.java:87)
        at org.jetbrains.kotlin.preloading.Preloader.main(Preloader.java:44)
Caused by: java.lang.ClassCastException: class org.jetbrains.kotlin.descriptors.impl.PropertyDescriptorImpl cannot be cast to class org.jetbrains.kotlin.descriptors.FunctionDescriptor (org.jetbrains.kotlin.descriptors.impl.PropertyDescriptorImpl and org.jetbrains.kotlin.descriptors.FunctionDescriptor are in unnamed module of loader org.jetbrains.kotlin.preloading.MemoryBasedClassLoader @4f023edb)
        at org.jetbrains.kotlin.contracts.parsing.ContractCallContext.<init>(ContractParsingServices.kt:111)
        at org.jetbrains.kotlin.contracts.parsing.ContractParsingServices.checkContractAndRecordIfPresent(ContractParsingServices.kt:49)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getBlockReturnedTypeWithWritableScope(ExpressionTypingServices.java:350)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getBlockReturnedType(ExpressionTypingServices.java:200)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getBlockReturnedType(ExpressionTypingServices.java:177)
        at org.jetbrains.kotlin.types.expressions.BasicExpressionTypingVisitor.visitBlockExpression(BasicExpressionTypingVisitor.java:637)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.visitBlockExpression(ExpressionTypingVisitorDispatcher.java:363)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher$ForDeclarations.visitBlockExpression(ExpressionTypingVisitorDispatcher.java:46)
        at org.jetbrains.kotlin.psi.KtBlockExpression.accept(KtBlockExpression.java:79)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.lambda$getTypeInfo$0(ExpressionTypingVisitorDispatcher.java:175)
        ... 67 more
exception: org.jetbrains.kotlin.util.KotlinFrontEndException: Exception while analyzing expression at at offset: 0 file: KtFile: program.kt
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.logOrThrowException(ExpressionTypingVisitorDispatcher.java:253)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.lambda$getTypeInfo$0(ExpressionTypingVisitorDispatcher.java:224)
        at org.jetbrains.kotlin.util.PerformanceCounter.time(PerformanceCounter.kt:101)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:164)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:134)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getTypeInfo(ExpressionTypingServices.java:124)
        at org.jetbrains.kotlin.resolve.calls.tower.PSICallResolver.resolveValueArgument(PSICallResolver.kt:769)
        at org.jetbrains.kotlin.resolve.calls.tower.PSICallResolver.resolveArgumentsInParenthesis(PSICallResolver.kt:706)
        at org.jetbrains.kotlin.resolve.calls.tower.PSICallResolver.toKotlinCall(PSICallResolver.kt:584)
        at org.jetbrains.kotlin.resolve.calls.tower.PSICallResolver.runResolutionAndInferenceForGivenCandidates(PSICallResolver.kt:130)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.doResolveCallOrGetCachedResults(CallResolver.java:605)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.lambda$resolveCallWithKnownCandidate$4(CallResolver.java:582)
        at org.jetbrains.kotlin.util.PerformanceCounter.time(PerformanceCounter.kt:101)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.resolveCallWithKnownCandidate(CallResolver.java:572)
        at org.jetbrains.kotlin.types.expressions.ControlStructureTypingUtils.resolveSpecialConstructionAsCall(ControlStructureTypingUtils.java:167)
        at org.jetbrains.kotlin.types.expressions.ControlStructureTypingUtils.resolveSpecialConstructionAsCall(ControlStructureTypingUtils.java:124)
        at org.jetbrains.kotlin.types.expressions.ControlStructureTypingVisitor.visitIfExpression(ControlStructureTypingVisitor.java:120)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.visitIfExpression(ExpressionTypingVisitorDispatcher.java:289)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher$ForDeclarations.visitIfExpression(ExpressionTypingVisitorDispatcher.java:46)
        at org.jetbrains.kotlin.psi.KtIfExpression.accept(KtIfExpression.java:33)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.lambda$getTypeInfo$0(ExpressionTypingVisitorDispatcher.java:175)
        at org.jetbrains.kotlin.util.PerformanceCounter.time(PerformanceCounter.kt:101)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:164)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:134)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:146)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getTypeInfo(ExpressionTypingServices.java:119)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getTypeInfo(ExpressionTypingServices.java:94)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getType(ExpressionTypingServices.java:136)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.safeGetType(ExpressionTypingServices.java:79)
        at org.jetbrains.kotlin.resolve.VariableTypeAndInitializerResolver.resolveInitializerType(VariableTypeAndInitializerResolver.kt:171)
        at org.jetbrains.kotlin.resolve.VariableTypeAndInitializerResolver.access$resolveInitializerType(VariableTypeAndInitializerResolver.kt:26)
        at org.jetbrains.kotlin.resolve.VariableTypeAndInitializerResolver$resolveTypeNullable$1.invoke(VariableTypeAndInitializerResolver.kt:91)
        at org.jetbrains.kotlin.resolve.VariableTypeAndInitializerResolver$resolveTypeNullable$1.invoke(VariableTypeAndInitializerResolver.kt:26)
        at org.jetbrains.kotlin.storage.LockBasedStorageManager$LockBasedLazyValue.invoke(LockBasedStorageManager.java:375)
        at org.jetbrains.kotlin.storage.LockBasedStorageManager$LockBasedNotNullLazyValue.invoke(LockBasedStorageManager.java:494)
        at org.jetbrains.kotlin.types.DeferredType.getDelegate(DeferredType.java:107)
        at org.jetbrains.kotlin.resolve.BodyResolver.computeDeferredType(BodyResolver.java:1015)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveProperty(BodyResolver.java:756)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolvePropertyDeclarationBodies(BodyResolver.java:802)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveBehaviorDeclarationBodies(BodyResolver.java:119)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveBodies(BodyResolver.java:246)
        at org.jetbrains.kotlin.resolve.LazyTopDownAnalyzer.analyzeDeclarations(LazyTopDownAnalyzer.kt:225)
        at org.jetbrains.kotlin.resolve.LazyTopDownAnalyzer.analyzeDeclarations$default(LazyTopDownAnalyzer.kt:60)
        at org.jetbrains.kotlin.cli.jvm.compiler.TopDownAnalyzerFacadeForJVM.analyzeFilesWithJavaIntegration(TopDownAnalyzerFacadeForJVM.kt:123)
        at org.jetbrains.kotlin.cli.jvm.compiler.TopDownAnalyzerFacadeForJVM.analyzeFilesWithJavaIntegration$default(TopDownAnalyzerFacadeForJVM.kt:93)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler$analyze$1.invoke(KotlinToJVMBytecodeCompiler.kt:557)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler$analyze$1.invoke(KotlinToJVMBytecodeCompiler.kt:83)
        at org.jetbrains.kotlin.cli.common.messages.AnalyzerWithCompilerReport.analyzeAndReport(AnalyzerWithCompilerReport.kt:115)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.analyze(KotlinToJVMBytecodeCompiler.kt:548)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli(KotlinToJVMBytecodeCompiler.kt:192)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli$default(KotlinToJVMBytecodeCompiler.kt:162)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:169)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:52)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:88)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:44)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:98)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:76)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:45)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit(CLITool.kt:227)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit$default(CLITool.kt:225)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMain(CLITool.kt:214)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler$Companion.main(K2JVMCompiler.kt:271)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.main(K2JVMCompiler.kt)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:566)
        at org.jetbrains.kotlin.preloading.Preloader.run(Preloader.java:87)
        at org.jetbrains.kotlin.preloading.Preloader.main(Preloader.java:44)
Caused by: java.lang.ClassCastException: class org.jetbrains.kotlin.descriptors.impl.PropertyDescriptorImpl cannot be cast to class org.jetbrains.kotlin.descriptors.FunctionDescriptor (org.jetbrains.kotlin.descriptors.impl.PropertyDescriptorImpl and org.jetbrains.kotlin.descriptors.FunctionDescriptor are in unnamed module of loader org.jetbrains.kotlin.preloading.MemoryBasedClassLoader @4f023edb)
        at org.jetbrains.kotlin.contracts.parsing.ContractCallContext.<init>(ContractParsingServices.kt:111)
        at org.jetbrains.kotlin.contracts.parsing.ContractParsingServices.checkContractAndRecordIfPresent(ContractParsingServices.kt:49)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getBlockReturnedTypeWithWritableScope(ExpressionTypingServices.java:350)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getBlockReturnedType(ExpressionTypingServices.java:200)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getBlockReturnedType(ExpressionTypingServices.java:177)
        at org.jetbrains.kotlin.types.expressions.BasicExpressionTypingVisitor.visitBlockExpression(BasicExpressionTypingVisitor.java:637)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.visitBlockExpression(ExpressionTypingVisitorDispatcher.java:363)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher$ForDeclarations.visitBlockExpression(ExpressionTypingVisitorDispatcher.java:46)
        at org.jetbrains.kotlin.psi.KtBlockExpression.accept(KtBlockExpression.java:79)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.lambda$getTypeInfo$0(ExpressionTypingVisitorDispatcher.java:175)
        ... 67 more"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	115,
	"KT-49092",
	"Kotlin",
	"kotlinc",
	"JVM: ArrayIndexOutOfBoundsException on compiling call with `if` expression and TODO() arguments",
	"https://youtrack.jetbrains.com/issue/KT-49092",
	"inference",
	NULL,
	NULL,
	"Submitted",
	NULL,
	"2021-10-05 07:15:01.335000",
	"None",
	"crash",
	"None",
	"class A {
    fun foo(x: Any, y: CharArray): Boolean = true
}
val x: A = A()
val y: Boolean = true
val z: Long = -61
val k = x.foo((if (y) z else Any()), TODO())",
	"stacktrace
exception: org.jetbrains.kotlin.codegen.CompilationException: Back-end (JVM) Internal error: Couldn''t transform method node:
<clinit> ()V:
   L0
    LINENUMBER 5 L0
    NEW A
    DUP
    INVOKESPECIAL A.<init> ()V
    PUTSTATIC ProgramKt.x : LA;
   L1
    LINENUMBER 6 L1
    ICONST_1
    PUTSTATIC ProgramKt.y : Z
   L2
    LINENUMBER 7 L2
    LDC -61
    PUTSTATIC ProgramKt.z : J
   L3
    LINENUMBER 8 L3
    GETSTATIC ProgramKt.x : LA;
    GETSTATIC ProgramKt.y : Z
    IFEQ L4
    GETSTATIC ProgramKt.z : J
    GOTO L5
   L4
    NEW java/lang/Object
    DUP
    INVOKESPECIAL java/lang/Object.<init> ()V
   L5
    NEW kotlin/NotImplementedError
    DUP
    ACONST_NULL
    ICONST_1
    ACONST_NULL
    INVOKESPECIAL kotlin/NotImplementedError.<init> (Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    ATHROW
   L6
    MAXSTACK = 8
    MAXLOCALS = 0
File is unknown
The root cause java.lang.ArrayIndexOutOfBoundsException was thrown at: org.jetbrains.org.objectweb.asm.Frame.merge(Frame.java:1268)
        at org.jetbrains.kotlin.codegen.TransformationMethodVisitor.visitEnd(TransformationMethodVisitor.kt:89)
        at org.jetbrains.org.objectweb.asm.MethodVisitor.visitEnd(MethodVisitor.java:783)
        at org.jetbrains.org.objectweb.asm.tree.MethodNode.accept(MethodNode.java:772)
        at org.jetbrains.kotlin.backend.jvm.codegen.ClassCodegen.generateMethod(ClassCodegen.kt:411)
        at org.jetbrains.kotlin.backend.jvm.codegen.ClassCodegen.generate(ClassCodegen.kt:136)
        at org.jetbrains.kotlin.backend.jvm.JvmLowerKt$codegenPhase$1$1.lower(JvmLower.kt:303)
        at org.jetbrains.kotlin.backend.common.phaser.FileLoweringPhaseAdapter.invoke(PhaseBuilders.kt:120)
        at org.jetbrains.kotlin.backend.common.phaser.FileLoweringPhaseAdapter.invoke(PhaseBuilders.kt:116)
        at org.jetbrains.kotlin.backend.common.phaser.NamedCompilerPhase.invoke(CompilerPhase.kt:96)
        at org.jetbrains.kotlin.backend.common.phaser.PerformByIrFilePhase.invokeSequential(performByIrFile.kt:65)
        at org.jetbrains.kotlin.backend.common.phaser.PerformByIrFilePhase.invoke(performByIrFile.kt:55)
        at org.jetbrains.kotlin.backend.common.phaser.PerformByIrFilePhase.invoke(performByIrFile.kt:41)
        at org.jetbrains.kotlin.backend.common.phaser.NamedCompilerPhase.invoke(CompilerPhase.kt:96)
        at org.jetbrains.kotlin.backend.common.phaser.CompositePhase.invoke(PhaseBuilders.kt:29)
        at org.jetbrains.kotlin.backend.common.phaser.NamedCompilerPhase.invoke(CompilerPhase.kt:96)
        at org.jetbrains.kotlin.backend.common.phaser.CompositePhase.invoke(PhaseBuilders.kt:29)
        at org.jetbrains.kotlin.backend.common.phaser.NamedCompilerPhase.invoke(CompilerPhase.kt:96)
        at org.jetbrains.kotlin.backend.common.phaser.CompilerPhaseKt.invokeToplevel(CompilerPhase.kt:43)
        at org.jetbrains.kotlin.backend.jvm.JvmIrCodegenFactory.doGenerateFilesInternal(JvmIrCodegenFactory.kt:193)
        at org.jetbrains.kotlin.backend.jvm.JvmIrCodegenFactory.generateModule(JvmIrCodegenFactory.kt:60)
        at org.jetbrains.kotlin.codegen.KotlinCodegenFacade.compileCorrectFiles(KotlinCodegenFacade.java:35)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.generate(KotlinToJVMBytecodeCompiler.kt:333)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli(KotlinToJVMBytecodeCompiler.kt:125)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli$default(KotlinToJVMBytecodeCompiler.kt:60)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:170)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:52)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:92)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:44)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:98)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:76)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:45)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit(CLITool.kt:227)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit$default(CLITool.kt:225)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMain(CLITool.kt:214)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler$Companion.main(K2JVMCompiler.kt:272)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.main(K2JVMCompiler.kt)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:566)
        at org.jetbrains.kotlin.preloading.Preloader.run(Preloader.java:87)
        at org.jetbrains.kotlin.preloading.Preloader.main(Preloader.java:44)
Caused by: java.lang.ArrayIndexOutOfBoundsException: Index 2 out of bounds for length 2
        at org.jetbrains.org.objectweb.asm.Frame.merge(Frame.java:1268)
        at org.jetbrains.org.objectweb.asm.Frame.merge(Frame.java:1244)
        at org.jetbrains.org.objectweb.asm.MethodWriter.computeAllFrames(MethodWriter.java:1610)
        at org.jetbrains.org.objectweb.asm.MethodWriter.visitMaxs(MethodWriter.java:1546)
        at org.jetbrains.org.objectweb.asm.MethodVisitor.visitMaxs(MethodVisitor.java:773)
        at org.jetbrains.org.objectweb.asm.tree.MethodNode.accept(MethodNode.java:769)
        at org.jetbrains.kotlin.codegen.TransformationMethodVisitor.visitEnd(TransformationMethodVisitor.kt:70)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	116,
	"KT-48764",
	"Kotlin",
	"kotlinc",
	"NI: Compile-time error when combining anonymous function and lambda in a conditional",
	"https://youtrack.jetbrains.com/issue/KT-48764",
	"inference",
	NULL,
	NULL,
	"Submitted",
	NULL,
	"2021-09-15 07:41:22.621000",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"fun test(x: Function<Any>): Unit {}
fun main() {
    val x: Function<Any> = (
        if (true) {x: String, y: String -> x + y}
        else fun(x: String) = x
    ) // this works
    test(
        if (true) { x: String, y: String -> x + y}
        else fun(x: String) = x
    ) // this does not work
}",
	"kotlin7.kt:11:14: error: type mismatch: inferred type is (String) -> String but (String, String) -> String was expected
        else fun(x: String) = x
             ^
kotlin7.kt:11:14: error: type mismatch: inferred type is (String) -> String but (String, String) -> TypeVariable(_R) was expected
        else fun(x: String) = x
             ^
kotlin7.kt:11:17: error: expected 2 parameters of types String, String
        else fun(x: String) = x
                ^"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	117,
	"KT-48958",
	"Kotlin",
	"kotlinc",
	"Inconsistency in overload resolution when calling a scope function",
	"https://youtrack.jetbrains.com/issue/KT-48958",
	"generator",
	NULL,
	NULL,
	"Submitted",
	NULL,
	"2021-09-28 09:22:25.441000",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"fun run(x: String): Unit  {}
inline fun <R> test(block: () -> R): R = block()
fun test(x: String): Unit {}
fun <T> ret(): T = TODO()
class A {
  fun d() {
    test(ret()) // Calls test(x: String): Unit
    run(ret()) // Calls <R> run(block: () -> R): R
  }
}
fun main() {
    test(ret()) // Calls test(x: String): Unit
    run(ret()) // Calls run(x: String): Unit
}",
	"test.kt:11:5: error: not enough information to infer type variable R
    run(ret()) // Calls <R> run(block: () -> R): R
    ^
test.kt:11:9: error: not enough information to infer type variable T
    run(ret()) // Calls <R> run(block: () -> R): R
        ^"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	118,
	"KT-48840",
	"Kotlin",
	"kotlinc",
	"Cannot assign callable reference to a variable with Functional Interface type without cast",
	"https://youtrack.jetbrains.com/issue/KT-48840",
	"generator",
	NULL,
	NULL,
	"Submitted",
	NULL,
	"2021-09-21 05:51:35.299000",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"fun interface FI {
  fun foo(p: Double): Long
}
fun bar(fi: FI) {}
class A {
    fun buz(p: Double): Long {
        return p.toLong()
    }
}
fun foo() {
    bar({p: Double -> p.toLong()}) // works
    val v1: FI = FI {p: Double -> p.toLong()} // works
    val a: A = A()
    bar(a::buz) // Works
    val v2: FI = FI a::buz // Fails -- wrong syntax?
    val v3: FI = a::buz // Fails
    val v4: FI = a::buz as FI // Work-around
}",
	"program.kt:19:18: error: function invocation ''FI(...)'' expected
    val v2: FI = FI a::buz // Fails -- wrong syntax?
                 ^
program.kt:19:18: error: no value passed for parameter ''function''
    val v2: FI = FI a::buz // Fails -- wrong syntax?
                 ^
program.kt:19:21: error: unresolved reference: a
    val v2: FI = FI a::buz // Fails -- wrong syntax?
                    ^"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	119,
	"KT-49024",
	"Kotlin",
	"kotlinc",
	"AssertionError: Variance conflict: type parameter variance ''out'' and projection kind ''in'' cannot be combined",
	"https://youtrack.jetbrains.com/issue/KT-49024",
	"inference",
	NULL,
	NULL,
	"Submitted",
	NULL,
	"2021-09-30 14:09:56.538000",
	"None",
	"crash",
	"None",
	"class Foo
class Bar<T1: Foo, out T2>
class Baz<T1, T2: Bar<Foo, out T2>>
class Qux<T1, T2: Baz<T2, Bar<Foo, T2>>>(var f: T2)
class Quux<T> {
  fun test(): Unit {
      val x: Qux<in T, Baz<T, Bar<Foo, in T>>> = TODO()
      x.f = TODO()
  }
}",
	"stacktrace
ERROR: Exception while analyzing expression at (10,7) in program.kt
org.jetbrains.kotlin.utils.KotlinExceptionWithAttachments: Exception while analyzing expression at (10,7) in program.kt
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.logOrThrowException(ExpressionTypingVisitorDispatcher.java:246)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.lambda$getTypeInfo$0(ExpressionTypingVisitorDispatcher.java:224)
        at org.jetbrains.kotlin.util.PerformanceCounter.time(PerformanceCounter.kt:101)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:164)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:134)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingUtils.getTypeInfoOrNullType(ExpressionTypingUtils.java:166)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorForStatements.visitAssignment(ExpressionTypingVisitorForStatements.java:398)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorForStatements.visitBinaryExpression(ExpressionTypingVisitorForStatements.java:184)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorForStatements.visitBinaryExpression(ExpressionTypingVisitorForStatements.java:67)
        at org.jetbrains.kotlin.psi.KtBinaryExpression.accept(KtBinaryExpression.java:35)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.lambda$getTypeInfo$0(ExpressionTypingVisitorDispatcher.java:175)
        at org.jetbrains.kotlin.util.PerformanceCounter.time(PerformanceCounter.kt:101)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:164)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:147)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getTypeOfLastExpressionInBlock(ExpressionTypingServices.java:402)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getBlockReturnedTypeWithWritableScope(ExpressionTypingServices.java:327)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getBlockReturnedType(ExpressionTypingServices.java:206)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getBlockReturnedType(ExpressionTypingServices.java:183)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorForStatements.visitBlockExpression(ExpressionTypingVisitorForStatements.java:479)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorForStatements.visitBlockExpression(ExpressionTypingVisitorForStatements.java:67)
        at org.jetbrains.kotlin.psi.KtBlockExpression.accept(KtBlockExpression.java:79)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.lambda$getTypeInfo$0(ExpressionTypingVisitorDispatcher.java:175)
        at org.jetbrains.kotlin.util.PerformanceCounter.time(PerformanceCounter.kt:101)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:164)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:147)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.checkFunctionReturnType(ExpressionTypingServices.java:178)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.checkFunctionReturnType(ExpressionTypingServices.java:165)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveFunctionBody(BodyResolver.java:1037)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveFunctionBody(BodyResolver.java:982)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveFunctionBodies(BodyResolver.java:967)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveBehaviorDeclarationBodies(BodyResolver.java:127)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveBodies(BodyResolver.java:254)
        at org.jetbrains.kotlin.resolve.LazyTopDownAnalyzer.analyzeDeclarations(LazyTopDownAnalyzer.kt:227)
        at org.jetbrains.kotlin.resolve.LazyTopDownAnalyzer.analyzeDeclarations$default(LazyTopDownAnalyzer.kt:58)
        at org.jetbrains.kotlin.cli.jvm.compiler.TopDownAnalyzerFacadeForJVM.analyzeFilesWithJavaIntegration(TopDownAnalyzerFacadeForJVM.kt:127)
        at org.jetbrains.kotlin.cli.jvm.compiler.TopDownAnalyzerFacadeForJVM.analyzeFilesWithJavaIntegration$default(TopDownAnalyzerFacadeForJVM.kt:86)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler$analyze$1.invoke(KotlinToJVMBytecodeCompiler.kt:252)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler$analyze$1.invoke(KotlinToJVMBytecodeCompiler.kt:243)
        at org.jetbrains.kotlin.cli.common.messages.AnalyzerWithCompilerReport.analyzeAndReport(AnalyzerWithCompilerReport.kt:113)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.analyze(KotlinToJVMBytecodeCompiler.kt:243)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli(KotlinToJVMBytecodeCompiler.kt:90)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli$default(KotlinToJVMBytecodeCompiler.kt:56)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:169)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:52)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:92)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:44)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:98)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:76)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:45)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit(CLITool.kt:227)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit$default(CLITool.kt:222)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMain(CLITool.kt:214)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler$Companion.main(K2JVMCompiler.kt:271)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.main(K2JVMCompiler.kt)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:568)
        at org.jetbrains.kotlin.preloading.Preloader.run(Preloader.java:87)
        at org.jetbrains.kotlin.preloading.Preloader.main(Preloader.java:44)
Caused by: java.lang.AssertionError: Variance conflict: type parameter variance ''out'' and projection kind ''in'' cannot be combined
        at org.jetbrains.kotlin.types.TypeSubstitutor.combine(TypeSubstitutor.java:410)
        at org.jetbrains.kotlin.types.TypeSubstitutor.combine(TypeSubstitutor.java:402)
        at org.jetbrains.kotlin.types.typesApproximation.CapturedTypeApproximationKt.toTypeArgument(CapturedTypeApproximation.kt:67)
        at org.jetbrains.kotlin.types.typesApproximation.CapturedTypeApproximationKt.approximateCapturedTypes(CapturedTypeApproximation.kt:146)
        at org.jetbrains.kotlin.types.typesApproximation.CapturedTypeApproximationKt.approximateProjection(CapturedTypeApproximation.kt:171)
        at org.jetbrains.kotlin.types.typesApproximation.CapturedTypeApproximationKt.approximateCapturedTypes(CapturedTypeApproximation.kt:153)
        at org.jetbrains.kotlin.types.typesApproximation.CapturedTypeApproximationKt.approximateProjection(CapturedTypeApproximation.kt:171)
        at org.jetbrains.kotlin.types.typesApproximation.CapturedTypeApproximationKt.approximateCapturedTypes(CapturedTypeApproximation.kt:153)
        at org.jetbrains.kotlin.types.typesApproximation.CapturedTypeApproximationKt.approximateCapturedTypesIfNecessary(CapturedTypeApproximation.kt:84)
        at org.jetbrains.kotlin.types.TypeSubstitutor.substitute(TypeSubstitutor.java:151)
        at org.jetbrains.kotlin.types.TypeSubstitutor.substitute(TypeSubstitutor.java:140)
        at org.jetbrains.kotlin.descriptors.impl.AbstractReceiverParameterDescriptor.substitute(AbstractReceiverParameterDescriptor.java:52)
        at org.jetbrains.kotlin.descriptors.impl.PropertyDescriptorImpl.doSubstitute(PropertyDescriptorImpl.java:406)
        at org.jetbrains.kotlin.descriptors.impl.PropertyDescriptorImpl$CopyConfiguration.build(PropertyDescriptorImpl.java:356)
        at org.jetbrains.kotlin.descriptors.impl.PropertyDescriptorImpl.substitute(PropertyDescriptorImpl.java:249)
        at org.jetbrains.kotlin.descriptors.impl.PropertyDescriptorImpl.substitute(PropertyDescriptorImpl.java:36)
        at org.jetbrains.kotlin.resolve.scopes.SubstitutingScope.substitute(SubstitutingScope.kt:47)
        at org.jetbrains.kotlin.resolve.scopes.SubstitutingScope.substitute(SubstitutingScope.kt:65)
        at org.jetbrains.kotlin.resolve.scopes.SubstitutingScope.getContributedVariables(SubstitutingScope.kt:72)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerLevelsKt.getContributedVariablesAndIntercept(TowerLevels.kt:417)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerLevelsKt.access$getContributedVariablesAndIntercept(TowerLevels.kt:1)
        at org.jetbrains.kotlin.resolve.calls.tower.MemberScopeTowerLevel$getVariables$1.invoke(TowerLevels.kt:174)
        at org.jetbrains.kotlin.resolve.calls.tower.MemberScopeTowerLevel$getVariables$1.invoke(TowerLevels.kt:174)
        at org.jetbrains.kotlin.resolve.calls.tower.MemberScopeTowerLevel.collectMembers(TowerLevels.kt:101)
        at org.jetbrains.kotlin.resolve.calls.tower.MemberScopeTowerLevel.getVariables(TowerLevels.kt:174)
        at org.jetbrains.kotlin.resolve.calls.tower.ScopeTowerProcessorsKt$createVariableProcessor$1.invoke(ScopeTowerProcessors.kt:221)
        at org.jetbrains.kotlin.resolve.calls.tower.ScopeTowerProcessorsKt$createVariableProcessor$1.invoke(ScopeTowerProcessors.kt:221)
        at org.jetbrains.kotlin.resolve.calls.tower.ExplicitReceiverScopeTowerProcessor.simpleProcess(ScopeTowerProcessors.kt:99)
        at org.jetbrains.kotlin.resolve.calls.tower.SimpleScopeTowerProcessor$DefaultImpls.process(ScopeTowerProcessors.kt:60)
        at org.jetbrains.kotlin.resolve.calls.tower.AbstractSimpleScopeTowerProcessor.process(ScopeTowerProcessors.kt:63)
        at org.jetbrains.kotlin.resolve.calls.tower.PrioritizedCompositeScopeTowerProcessor.process(ScopeTowerProcessors.kt:38)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver.processTowerData(TowerResolver.kt:287)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver.access$processTowerData(TowerResolver.kt:80)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver$Task.process(TowerResolver.kt:161)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver$Task.run(TowerResolver.kt:180)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver.run(TowerResolver.kt:99)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver.runResolve(TowerResolver.kt:86)
        at org.jetbrains.kotlin.resolve.calls.KotlinCallResolver.resolveCall(KotlinCallResolver.kt:75)
        at org.jetbrains.kotlin.resolve.calls.tower.PSICallResolver.runResolutionAndInference(PSICallResolver.kt:101)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.doResolveCallOrGetCachedResults(CallResolver.java:601)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.lambda$computeTasksAndResolveCall$0(CallResolver.java:213)
        at org.jetbrains.kotlin.util.PerformanceCounter.time(PerformanceCounter.kt:101)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.computeTasksAndResolveCall(CallResolver.java:211)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.computeTasksAndResolveCall(CallResolver.java:199)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.resolveSimpleProperty(CallResolver.java:140)
        at org.jetbrains.kotlin.resolve.calls.CallExpressionResolver.getVariableType(CallExpressionResolver.kt:111)
        at org.jetbrains.kotlin.resolve.calls.CallExpressionResolver.getSimpleNameExpressionTypeInfo(CallExpressionResolver.kt:146)
        at org.jetbrains.kotlin.resolve.calls.CallExpressionResolver.getUnsafeSelectorTypeInfo(CallExpressionResolver.kt:337)
        at org.jetbrains.kotlin.resolve.calls.CallExpressionResolver.getSafeOrUnsafeSelectorTypeInfo(CallExpressionResolver.kt:377)
        at org.jetbrains.kotlin.resolve.calls.CallExpressionResolver.getQualifiedExpressionTypeInfo(CallExpressionResolver.kt:474)
        at org.jetbrains.kotlin.types.expressions.BasicExpressionTypingVisitor.visitQualifiedExpression(BasicExpressionTypingVisitor.java:702)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.visitQualifiedExpression(ExpressionTypingVisitorDispatcher.java:383)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher$ForBlock.visitQualifiedExpression(ExpressionTypingVisitorDispatcher.java:59)
        at org.jetbrains.kotlin.psi.KtVisitor.visitDotQualifiedExpression(KtVisitor.java:302)
        at org.jetbrains.kotlin.psi.KtDotQualifiedExpression.accept(KtDotQualifiedExpression.kt:32)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.lambda$getTypeInfo$0(ExpressionTypingVisitorDispatcher.java:175)
        ... 58 more
exception: org.jetbrains.kotlin.util.KotlinFrontEndException: Exception while analyzing expression at (10,7) in program.kt
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.logOrThrowException(ExpressionTypingVisitorDispatcher.java:253)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.lambda$getTypeInfo$0(ExpressionTypingVisitorDispatcher.java:224)
        at org.jetbrains.kotlin.util.PerformanceCounter.time(PerformanceCounter.kt:101)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:164)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:134)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingUtils.getTypeInfoOrNullType(ExpressionTypingUtils.java:166)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorForStatements.visitAssignment(ExpressionTypingVisitorForStatements.java:398)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorForStatements.visitBinaryExpression(ExpressionTypingVisitorForStatements.java:184)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorForStatements.visitBinaryExpression(ExpressionTypingVisitorForStatements.java:67)
        at org.jetbrains.kotlin.psi.KtBinaryExpression.accept(KtBinaryExpression.java:35)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.lambda$getTypeInfo$0(ExpressionTypingVisitorDispatcher.java:175)
        at org.jetbrains.kotlin.util.PerformanceCounter.time(PerformanceCounter.kt:101)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:164)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:147)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getTypeOfLastExpressionInBlock(ExpressionTypingServices.java:402)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getBlockReturnedTypeWithWritableScope(ExpressionTypingServices.java:327)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getBlockReturnedType(ExpressionTypingServices.java:206)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.getBlockReturnedType(ExpressionTypingServices.java:183)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorForStatements.visitBlockExpression(ExpressionTypingVisitorForStatements.java:479)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorForStatements.visitBlockExpression(ExpressionTypingVisitorForStatements.java:67)
        at org.jetbrains.kotlin.psi.KtBlockExpression.accept(KtBlockExpression.java:79)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.lambda$getTypeInfo$0(ExpressionTypingVisitorDispatcher.java:175)
        at org.jetbrains.kotlin.util.PerformanceCounter.time(PerformanceCounter.kt:101)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:164)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.getTypeInfo(ExpressionTypingVisitorDispatcher.java:147)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.checkFunctionReturnType(ExpressionTypingServices.java:178)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingServices.checkFunctionReturnType(ExpressionTypingServices.java:165)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveFunctionBody(BodyResolver.java:1037)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveFunctionBody(BodyResolver.java:982)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveFunctionBodies(BodyResolver.java:967)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveBehaviorDeclarationBodies(BodyResolver.java:127)
        at org.jetbrains.kotlin.resolve.BodyResolver.resolveBodies(BodyResolver.java:254)
        at org.jetbrains.kotlin.resolve.LazyTopDownAnalyzer.analyzeDeclarations(LazyTopDownAnalyzer.kt:227)
        at org.jetbrains.kotlin.resolve.LazyTopDownAnalyzer.analyzeDeclarations$default(LazyTopDownAnalyzer.kt:58)
        at org.jetbrains.kotlin.cli.jvm.compiler.TopDownAnalyzerFacadeForJVM.analyzeFilesWithJavaIntegration(TopDownAnalyzerFacadeForJVM.kt:127)
        at org.jetbrains.kotlin.cli.jvm.compiler.TopDownAnalyzerFacadeForJVM.analyzeFilesWithJavaIntegration$default(TopDownAnalyzerFacadeForJVM.kt:86)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler$analyze$1.invoke(KotlinToJVMBytecodeCompiler.kt:252)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler$analyze$1.invoke(KotlinToJVMBytecodeCompiler.kt:243)
        at org.jetbrains.kotlin.cli.common.messages.AnalyzerWithCompilerReport.analyzeAndReport(AnalyzerWithCompilerReport.kt:113)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.analyze(KotlinToJVMBytecodeCompiler.kt:243)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli(KotlinToJVMBytecodeCompiler.kt:90)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli$default(KotlinToJVMBytecodeCompiler.kt:56)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:169)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:52)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:92)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:44)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:98)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:76)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:45)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit(CLITool.kt:227)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit$default(CLITool.kt:222)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMain(CLITool.kt:214)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler$Companion.main(K2JVMCompiler.kt:271)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.main(K2JVMCompiler.kt)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:568)
        at org.jetbrains.kotlin.preloading.Preloader.run(Preloader.java:87)
        at org.jetbrains.kotlin.preloading.Preloader.main(Preloader.java:44)
Caused by: java.lang.AssertionError: Variance conflict: type parameter variance ''out'' and projection kind ''in'' cannot be combined
        at org.jetbrains.kotlin.types.TypeSubstitutor.combine(TypeSubstitutor.java:410)
        at org.jetbrains.kotlin.types.TypeSubstitutor.combine(TypeSubstitutor.java:402)
        at org.jetbrains.kotlin.types.typesApproximation.CapturedTypeApproximationKt.toTypeArgument(CapturedTypeApproximation.kt:67)
        at org.jetbrains.kotlin.types.typesApproximation.CapturedTypeApproximationKt.approximateCapturedTypes(CapturedTypeApproximation.kt:146)
        at org.jetbrains.kotlin.types.typesApproximation.CapturedTypeApproximationKt.approximateProjection(CapturedTypeApproximation.kt:171)
        at org.jetbrains.kotlin.types.typesApproximation.CapturedTypeApproximationKt.approximateCapturedTypes(CapturedTypeApproximation.kt:153)
        at org.jetbrains.kotlin.types.typesApproximation.CapturedTypeApproximationKt.approximateProjection(CapturedTypeApproximation.kt:171)
        at org.jetbrains.kotlin.types.typesApproximation.CapturedTypeApproximationKt.approximateCapturedTypes(CapturedTypeApproximation.kt:153)
        at org.jetbrains.kotlin.types.typesApproximation.CapturedTypeApproximationKt.approximateCapturedTypesIfNecessary(CapturedTypeApproximation.kt:84)
        at org.jetbrains.kotlin.types.TypeSubstitutor.substitute(TypeSubstitutor.java:151)
        at org.jetbrains.kotlin.types.TypeSubstitutor.substitute(TypeSubstitutor.java:140)
        at org.jetbrains.kotlin.descriptors.impl.AbstractReceiverParameterDescriptor.substitute(AbstractReceiverParameterDescriptor.java:52)
        at org.jetbrains.kotlin.descriptors.impl.PropertyDescriptorImpl.doSubstitute(PropertyDescriptorImpl.java:406)
        at org.jetbrains.kotlin.descriptors.impl.PropertyDescriptorImpl$CopyConfiguration.build(PropertyDescriptorImpl.java:356)
        at org.jetbrains.kotlin.descriptors.impl.PropertyDescriptorImpl.substitute(PropertyDescriptorImpl.java:249)
        at org.jetbrains.kotlin.descriptors.impl.PropertyDescriptorImpl.substitute(PropertyDescriptorImpl.java:36)
        at org.jetbrains.kotlin.resolve.scopes.SubstitutingScope.substitute(SubstitutingScope.kt:47)
        at org.jetbrains.kotlin.resolve.scopes.SubstitutingScope.substitute(SubstitutingScope.kt:65)
        at org.jetbrains.kotlin.resolve.scopes.SubstitutingScope.getContributedVariables(SubstitutingScope.kt:72)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerLevelsKt.getContributedVariablesAndIntercept(TowerLevels.kt:417)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerLevelsKt.access$getContributedVariablesAndIntercept(TowerLevels.kt:1)
        at org.jetbrains.kotlin.resolve.calls.tower.MemberScopeTowerLevel$getVariables$1.invoke(TowerLevels.kt:174)
        at org.jetbrains.kotlin.resolve.calls.tower.MemberScopeTowerLevel$getVariables$1.invoke(TowerLevels.kt:174)
        at org.jetbrains.kotlin.resolve.calls.tower.MemberScopeTowerLevel.collectMembers(TowerLevels.kt:101)
        at org.jetbrains.kotlin.resolve.calls.tower.MemberScopeTowerLevel.getVariables(TowerLevels.kt:174)
        at org.jetbrains.kotlin.resolve.calls.tower.ScopeTowerProcessorsKt$createVariableProcessor$1.invoke(ScopeTowerProcessors.kt:221)
        at org.jetbrains.kotlin.resolve.calls.tower.ScopeTowerProcessorsKt$createVariableProcessor$1.invoke(ScopeTowerProcessors.kt:221)
        at org.jetbrains.kotlin.resolve.calls.tower.ExplicitReceiverScopeTowerProcessor.simpleProcess(ScopeTowerProcessors.kt:99)
        at org.jetbrains.kotlin.resolve.calls.tower.SimpleScopeTowerProcessor$DefaultImpls.process(ScopeTowerProcessors.kt:60)
        at org.jetbrains.kotlin.resolve.calls.tower.AbstractSimpleScopeTowerProcessor.process(ScopeTowerProcessors.kt:63)
        at org.jetbrains.kotlin.resolve.calls.tower.PrioritizedCompositeScopeTowerProcessor.process(ScopeTowerProcessors.kt:38)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver.processTowerData(TowerResolver.kt:287)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver.access$processTowerData(TowerResolver.kt:80)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver$Task.process(TowerResolver.kt:161)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver$Task.run(TowerResolver.kt:180)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver.run(TowerResolver.kt:99)
        at org.jetbrains.kotlin.resolve.calls.tower.TowerResolver.runResolve(TowerResolver.kt:86)
        at org.jetbrains.kotlin.resolve.calls.KotlinCallResolver.resolveCall(KotlinCallResolver.kt:75)
        at org.jetbrains.kotlin.resolve.calls.tower.PSICallResolver.runResolutionAndInference(PSICallResolver.kt:101)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.doResolveCallOrGetCachedResults(CallResolver.java:601)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.lambda$computeTasksAndResolveCall$0(CallResolver.java:213)
        at org.jetbrains.kotlin.util.PerformanceCounter.time(PerformanceCounter.kt:101)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.computeTasksAndResolveCall(CallResolver.java:211)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.computeTasksAndResolveCall(CallResolver.java:199)
        at org.jetbrains.kotlin.resolve.calls.CallResolver.resolveSimpleProperty(CallResolver.java:140)
        at org.jetbrains.kotlin.resolve.calls.CallExpressionResolver.getVariableType(CallExpressionResolver.kt:111)
        at org.jetbrains.kotlin.resolve.calls.CallExpressionResolver.getSimpleNameExpressionTypeInfo(CallExpressionResolver.kt:146)
        at org.jetbrains.kotlin.resolve.calls.CallExpressionResolver.getUnsafeSelectorTypeInfo(CallExpressionResolver.kt:337)
        at org.jetbrains.kotlin.resolve.calls.CallExpressionResolver.getSafeOrUnsafeSelectorTypeInfo(CallExpressionResolver.kt:377)
        at org.jetbrains.kotlin.resolve.calls.CallExpressionResolver.getQualifiedExpressionTypeInfo(CallExpressionResolver.kt:474)
        at org.jetbrains.kotlin.types.expressions.BasicExpressionTypingVisitor.visitQualifiedExpression(BasicExpressionTypingVisitor.java:702)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.visitQualifiedExpression(ExpressionTypingVisitorDispatcher.java:383)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher$ForBlock.visitQualifiedExpression(ExpressionTypingVisitorDispatcher.java:59)
        at org.jetbrains.kotlin.psi.KtVisitor.visitDotQualifiedExpression(KtVisitor.java:302)
        at org.jetbrains.kotlin.psi.KtDotQualifiedExpression.accept(KtDotQualifiedExpression.kt:32)
        at org.jetbrains.kotlin.types.expressions.ExpressionTypingVisitorDispatcher.lambda$getTypeInfo$0(ExpressionTypingVisitorDispatcher.java:175)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	120,
	"KT-48838",
	"Kotlin",
	"kotlinc",
	"TYPE_MISMATCH error when combining SAM-coercion and parameterized function",
	"https://youtrack.jetbrains.com/issue/KT-48838",
	"generator",
	NULL,
	NULL,
	"Submitted",
	NULL,
	"2021-09-21 05:42:14.025000",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"fun interface FI {
    fun foo(i: Int): Int
}
fun test1(x: FI) {}
fun <T> test2(x: T) {}
fun main() {
    test1({x: Int -> x})
    test2<FI>({x: Int -> x}) // error [TYPE_MISMATCH] Type mismatch.
}",
	"program.kt:11:15: error: type mismatch: inferred type is (Int) -> Int but FI was expected
    test2<FI>({x: Int -> x})
              ^
program.kt:11:26: error: type mismatch: inferred type is (Int) -> Int but FI was expected
    test2<FI>({x: Int -> x})
                         ^"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	121,
	"KT-48858",
	"Kotlin",
	"kotlinc",
	"TYPE_MISMATCH error when applying `fun interface` in the initialization of a type constructor",
	"https://youtrack.jetbrains.com/issue/KT-48858",
	"generator",
	NULL,
	NULL,
	"Submitted",
	NULL,
	"2021-09-22 05:12:24.541000",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"fun interface FI {
  fun foo(p: Double): Long
}
class A(val x: FI)
class B<T>(val x: T)
fun foo() {
    val x = {p: Double -> p.toLong()}
    val a1 = A({p: Double -> p.toLong()})
    val a2 = A(x)
    val b1 = B<FI>({p: Double -> p.toLong()}) // [TYPE_MISMATCH] Type mismatch.
    val b2 = B<FI>(x) // [TYPE_MISMATCH] Type mismatch.
}",
	"program.kt:12:20: error: type mismatch: inferred type is (Double) -> Long but FI was expected
    val b1 = B<FI>({p: Double -> p.toLong()}) // error
                   ^
program.kt:12:34: error: type mismatch: inferred type is (Double) -> Long but FI was expected
    val b1 = B<FI>({p: Double -> p.toLong()}) // error
                                 ^
program.kt:13:20: error: type mismatch: inferred type is (Double) -> Long but FI was expected
    val b2 = B<FI>(x) // error
                   ^"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	122,
	"KT-48671",
	"Kotlin",
	"kotlinc",
	"JVM / IR: ""AssertionError: Primitive array expected: CLASS IR_EXTERNAL_DECLARATION_STUB CLASS""",
	"https://youtrack.jetbrains.com/issue/KT-48671",
	"generator",
	NULL,
	NULL,
	"Closed",
	"Fixed",
	"2021-09-08 09:20:13.999000",
	"2021-09-11 15:20:49.044000",
	"crash",
	"3 days, 6:00:35.045000",
	"val x: Any = arrayOf<Any>(emptyArray<Int>(), intArrayOf(9, 19, -3))
class A",
	"stacktrace
exception: org.jetbrains.kotlin.backend.common.BackendException: Backend Internal error: Exception during IR lowering
File being compiled: program.kt
The root cause java.lang.AssertionError was thrown at: org.jetbrains.kotlin.ir.types.IrTypeUtilsKt.getArrayElementType(IrTypeUtils.kt:68)
        at org.jetbrains.kotlin.backend.common.CodegenUtil.reportBackendException(CodegenUtil.kt:239)
        at org.jetbrains.kotlin.backend.common.CodegenUtil.reportBackendException$default(CodegenUtil.kt:235)
        at org.jetbrains.kotlin.backend.common.phaser.PerformByIrFilePhase.invokeSequential(performByIrFile.kt:68)
        at org.jetbrains.kotlin.backend.common.phaser.PerformByIrFilePhase.invoke(performByIrFile.kt:55)
        at org.jetbrains.kotlin.backend.common.phaser.PerformByIrFilePhase.invoke(performByIrFile.kt:41)
        at org.jetbrains.kotlin.backend.common.phaser.NamedCompilerPhase.invoke(CompilerPhase.kt:96)
        at org.jetbrains.kotlin.backend.common.phaser.CompositePhase.invoke(PhaseBuilders.kt:29)
        at org.jetbrains.kotlin.backend.common.phaser.NamedCompilerPhase.invoke(CompilerPhase.kt:96)
        at org.jetbrains.kotlin.backend.common.phaser.CompositePhase.invoke(PhaseBuilders.kt:22)
        at org.jetbrains.kotlin.backend.common.phaser.NamedCompilerPhase.invoke(CompilerPhase.kt:96)
        at org.jetbrains.kotlin.backend.common.phaser.CompilerPhaseKt.invokeToplevel(CompilerPhase.kt:43)
        at org.jetbrains.kotlin.backend.jvm.JvmIrCodegenFactory.doGenerateFilesInternal(JvmIrCodegenFactory.kt:191)
        at org.jetbrains.kotlin.backend.jvm.JvmIrCodegenFactory.generateModule(JvmIrCodegenFactory.kt:60)
        at org.jetbrains.kotlin.codegen.KotlinCodegenFacade.compileCorrectFiles(KotlinCodegenFacade.java:35)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.generate(KotlinToJVMBytecodeCompiler.kt:321)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli(KotlinToJVMBytecodeCompiler.kt:113)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli$default(KotlinToJVMBytecodeCompiler.kt:56)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:169)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:52)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:92)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:44)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:98)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:76)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:45)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit(CLITool.kt:227)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit$default(CLITool.kt:222)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMain(CLITool.kt:214)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler$Companion.main(K2JVMCompiler.kt:271)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.main(K2JVMCompiler.kt)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:568)
        at org.jetbrains.kotlin.preloading.Preloader.run(Preloader.java:87)
        at org.jetbrains.kotlin.preloading.Preloader.main(Preloader.java:44)
Caused by: java.lang.AssertionError: Primitive array expected: CLASS IR_EXTERNAL_DECLARATION_STUB CLASS name:Any modality:OPEN visibility:public superTypes:[]
        at org.jetbrains.kotlin.ir.types.IrTypeUtilsKt.getArrayElementType(IrTypeUtils.kt:68)
        at org.jetbrains.kotlin.backend.jvm.ir.IrArrayBuilder.<init>(IrArrayBuilder.kt:38)
        at org.jetbrains.kotlin.backend.jvm.lower.VarargLowering.visitVararg(VarargLowering.kt:130)
        at org.jetbrains.kotlin.ir.visitors.IrElementTransformerVoid.visitVararg(IrElementTransformerVoid.kt:141)
        at org.jetbrains.kotlin.ir.visitors.IrElementTransformerVoid.visitVararg(IrElementTransformerVoid.kt:24)
        at org.jetbrains.kotlin.ir.expressions.impl.IrVarargImpl.accept(IrVarargImpl.kt:53)
        at org.jetbrains.kotlin.ir.expressions.IrExpression.transform(IrExpression.kt:33)
        at org.jetbrains.kotlin.backend.jvm.lower.VarargLowering.addVararg(VarargLowering.kt:83)
        at org.jetbrains.kotlin.backend.jvm.lower.VarargLowering.visitVararg(VarargLowering.kt:78)
        at org.jetbrains.kotlin.ir.visitors.IrElementTransformerVoid.visitVararg(IrElementTransformerVoid.kt:141)
        at org.jetbrains.kotlin.ir.visitors.IrElementTransformerVoid.visitVararg(IrElementTransformerVoid.kt:24)
        at org.jetbrains.kotlin.ir.expressions.impl.IrVarargImpl.accept(IrVarargImpl.kt:53)
        at org.jetbrains.kotlin.ir.expressions.IrExpression.transform(IrExpression.kt:33)
        at org.jetbrains.kotlin.ir.expressions.IrExpressionBody.transformChildren(IrBody.kt:46)
        at org.jetbrains.kotlin.ir.visitors.IrElementTransformerVoid.visitBody(IrElementTransformerVoid.kt:108)
        at org.jetbrains.kotlin.ir.visitors.IrElementTransformerVoid.visitExpressionBody(IrElementTransformerVoid.kt:114)
        at org.jetbrains.kotlin.ir.visitors.IrElementTransformerVoid.visitExpressionBody(IrElementTransformerVoid.kt:115)
        at org.jetbrains.kotlin.ir.visitors.IrElementTransformerVoid.visitExpressionBody(IrElementTransformerVoid.kt:24)
        at org.jetbrains.kotlin.ir.expressions.IrExpressionBody.accept(IrBody.kt:36)
        at org.jetbrains.kotlin.ir.expressions.IrExpressionBody.transform(IrBody.kt:39)
        at org.jetbrains.kotlin.ir.declarations.IrField.transformChildren(IrField.kt:41)
        at org.jetbrains.kotlin.ir.visitors.IrElementTransformerVoid.visitDeclaration(IrElementTransformerVoid.kt:57)
        at org.jetbrains.kotlin.ir.visitors.IrElementTransformerVoid.visitField(IrElementTransformerVoid.kt:81)
        at org.jetbrains.kotlin.backend.common.IrElementTransformerVoidWithContext.visitFieldNew(IrElementTransformerVoidWithContext.kt:123)
        at org.jetbrains.kotlin.backend.common.IrElementTransformerVoidWithContext.visitField(IrElementTransformerVoidWithContext.kt:61)
        at org.jetbrains.kotlin.ir.visitors.IrElementTransformerVoid.visitField(IrElementTransformerVoid.kt:82)
        at org.jetbrains.kotlin.ir.visitors.IrElementTransformerVoid.visitField(IrElementTransformerVoid.kt:24)
        at org.jetbrains.kotlin.ir.declarations.IrField.accept(IrField.kt:34)
        at org.jetbrains.kotlin.ir.IrElement$DefaultImpls.transform(IrElement.kt:32)
        at org.jetbrains.kotlin.ir.IrElementBase.transform(IrElementBase.kt:19)
        at org.jetbrains.kotlin.ir.declarations.IrProperty.transformChildren(IrProperty.kt:58)
        at org.jetbrains.kotlin.ir.visitors.IrElementTransformerVoid.visitDeclaration(IrElementTransformerVoid.kt:57)
        at org.jetbrains.kotlin.ir.visitors.IrElementTransformerVoid.visitProperty(IrElementTransformerVoid.kt:78)
        at org.jetbrains.kotlin.backend.common.IrElementTransformerVoidWithContext.visitPropertyNew(IrElementTransformerVoidWithContext.kt:119)
        at org.jetbrains.kotlin.backend.common.IrElementTransformerVoidWithContext.visitProperty(IrElementTransformerVoidWithContext.kt:54)
        at org.jetbrains.kotlin.ir.visitors.IrElementTransformerVoid.visitProperty(IrElementTransformerVoid.kt:79)
        at org.jetbrains.kotlin.ir.visitors.IrElementTransformerVoid.visitProperty(IrElementTransformerVoid.kt:24)
        at org.jetbrains.kotlin.ir.declarations.IrProperty.accept(IrProperty.kt:49)
        at org.jetbrains.kotlin.ir.IrElement$DefaultImpls.transform(IrElement.kt:32)
        at org.jetbrains.kotlin.ir.IrElementBase.transform(IrElementBase.kt:19)
        at org.jetbrains.kotlin.ir.util.TransformKt.transformInPlace(transform.kt:35)
        at org.jetbrains.kotlin.ir.declarations.IrClass.transformChildren(IrClass.kt:66)
        at org.jetbrains.kotlin.ir.visitors.IrElementTransformerVoid.visitDeclaration(IrElementTransformerVoid.kt:57)
        at org.jetbrains.kotlin.ir.visitors.IrElementTransformerVoid.visitClass(IrElementTransformerVoid.kt:66)
        at org.jetbrains.kotlin.backend.common.IrElementTransformerVoidWithContext.visitClassNew(IrElementTransformerVoidWithContext.kt:111)
        at org.jetbrains.kotlin.backend.common.IrElementTransformerVoidWithContext.visitClass(IrElementTransformerVoidWithContext.kt:47)
        at org.jetbrains.kotlin.ir.visitors.IrElementTransformerVoid.visitClass(IrElementTransformerVoid.kt:67)
        at org.jetbrains.kotlin.ir.visitors.IrElementTransformerVoid.visitClass(IrElementTransformerVoid.kt:24)
        at org.jetbrains.kotlin.ir.declarations.IrClass.accept(IrClass.kt:55)
        at org.jetbrains.kotlin.ir.IrElement$DefaultImpls.transform(IrElement.kt:32)
        at org.jetbrains.kotlin.ir.IrElementBase.transform(IrElementBase.kt:19)
        at org.jetbrains.kotlin.ir.declarations.impl.IrFileImpl.transformChildren(IrFileImpl.kt:89)
        at org.jetbrains.kotlin.ir.visitors.IrElementTransformerVoidKt.transformChildrenVoid(IrElementTransformerVoid.kt:330)
        at org.jetbrains.kotlin.ir.visitors.IrElementTransformerVoid.transformChildrenVoid(IrElementTransformerVoid.kt:325)
        at org.jetbrains.kotlin.backend.jvm.lower.VarargLowering.lower(VarargLowering.kt:38)
        at org.jetbrains.kotlin.backend.common.phaser.FileLoweringPhaseAdapter.invoke(PhaseBuilders.kt:120)
        at org.jetbrains.kotlin.backend.common.phaser.FileLoweringPhaseAdapter.invoke(PhaseBuilders.kt:116)
        at org.jetbrains.kotlin.backend.common.phaser.NamedCompilerPhase.invoke(CompilerPhase.kt:96)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	123,
	"KT-48766",
	"Kotlin",
	"kotlinc",
	"JVM IR: ""AnalyzerException: Argument 1: expected I, but found R"" when assigning an array of numbers to an Any variable",
	"https://youtrack.jetbrains.com/issue/KT-48766",
	"generator",
	NULL,
	NULL,
	"Closed",
	"Obsolete",
	"2021-09-15 08:25:01.309000",
	"2021-09-15 09:33:48.421000",
	"crash",
	"1:08:47.112000",
	"val x: Any = arrayOf<Number>(-74, -43)",
	"stacktrace
exception: org.jetbrains.kotlin.codegen.CompilationException: Back-end (JVM) Internal error: Couldn''t transform method node:
<clinit> ()V:
   L0
    LINENUMBER 1 L0
    ICONST_2
    ANEWARRAY java/lang/Number
    ASTORE 0
   L1
    ALOAD 0
    ICONST_0
    BIPUSH -74
    AASTORE
    ALOAD 0
    ICONST_1
    BIPUSH -43
    AASTORE
    ALOAD 0
   L2
    PUTSTATIC ProgramKt.x : Ljava/lang/Object;
    RETURN
   L3
    MAXSTACK = 3
    MAXLOCALS = 1
File is unknown
The root cause java.lang.AssertionError was thrown at: org.jetbrains.kotlin.codegen.optimization.MethodVerifier.transform(MethodVerifier.kt:28)
        at org.jetbrains.kotlin.codegen.TransformationMethodVisitor.visitEnd(TransformationMethodVisitor.kt:92)
        at org.jetbrains.org.objectweb.asm.MethodVisitor.visitEnd(MethodVisitor.java:782)
        at org.jetbrains.org.objectweb.asm.tree.MethodNode.accept(MethodNode.java:772)
        at org.jetbrains.kotlin.backend.jvm.codegen.ClassCodegen.generateMethod(ClassCodegen.kt:391)
        at org.jetbrains.kotlin.backend.jvm.codegen.ClassCodegen.generate(ClassCodegen.kt:134)
        at org.jetbrains.kotlin.backend.jvm.JvmLowerKt$codegenPhase$1$1.lower(JvmLower.kt:304)
        at org.jetbrains.kotlin.backend.common.phaser.FileLoweringPhaseAdapter.invoke(PhaseBuilders.kt:120)
        at org.jetbrains.kotlin.backend.common.phaser.FileLoweringPhaseAdapter.invoke(PhaseBuilders.kt:116)
        at org.jetbrains.kotlin.backend.common.phaser.NamedCompilerPhase.invoke(CompilerPhase.kt:96)
        at org.jetbrains.kotlin.backend.common.phaser.PerformByIrFilePhase.invokeSequential(performByIrFile.kt:65)
        at org.jetbrains.kotlin.backend.common.phaser.PerformByIrFilePhase.invoke(performByIrFile.kt:55)
        at org.jetbrains.kotlin.backend.common.phaser.PerformByIrFilePhase.invoke(performByIrFile.kt:41)
        at org.jetbrains.kotlin.backend.common.phaser.NamedCompilerPhase.invoke(CompilerPhase.kt:96)
        at org.jetbrains.kotlin.backend.common.phaser.CompositePhase.invoke(PhaseBuilders.kt:29)
        at org.jetbrains.kotlin.backend.common.phaser.NamedCompilerPhase.invoke(CompilerPhase.kt:96)
        at org.jetbrains.kotlin.backend.common.phaser.CompositePhase.invoke(PhaseBuilders.kt:29)
        at org.jetbrains.kotlin.backend.common.phaser.NamedCompilerPhase.invoke(CompilerPhase.kt:96)
        at org.jetbrains.kotlin.backend.common.phaser.CompilerPhaseKt.invokeToplevel(CompilerPhase.kt:43)
        at org.jetbrains.kotlin.backend.jvm.JvmIrCodegenFactory.doGenerateFilesInternal(JvmIrCodegenFactory.kt:191)
        at org.jetbrains.kotlin.backend.jvm.JvmIrCodegenFactory.generateModule(JvmIrCodegenFactory.kt:60)
        at org.jetbrains.kotlin.codegen.KotlinCodegenFacade.compileCorrectFiles(KotlinCodegenFacade.java:35)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.generate(KotlinToJVMBytecodeCompiler.kt:321)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli(KotlinToJVMBytecodeCompiler.kt:113)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli$default(KotlinToJVMBytecodeCompiler.kt:56)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:169)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:52)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:92)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:44)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:98)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:76)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:45)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit(CLITool.kt:227)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit$default(CLITool.kt:222)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMain(CLITool.kt:214)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler$Companion.main(K2JVMCompiler.kt:271)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.main(K2JVMCompiler.kt)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:566)
        at org.jetbrains.kotlin.preloading.Preloader.run(Preloader.java:87)
        at org.jetbrains.kotlin.preloading.Preloader.main(Preloader.java:44)
Caused by: java.lang.AssertionError: AFTER mandatory stack transformations: incorrect bytecode
        at org.jetbrains.kotlin.codegen.optimization.MethodVerifier.transform(MethodVerifier.kt:28)
        at org.jetbrains.kotlin.codegen.optimization.transformer.CompositeMethodTransformer.transform(CompositeMethodTransformer.kt:25)
        at org.jetbrains.kotlin.codegen.optimization.OptimizationMethodVisitor.performTransformations(OptimizationMethodVisitor.kt:62)
        at org.jetbrains.kotlin.codegen.TransformationMethodVisitor.visitEnd(TransformationMethodVisitor.kt:70)
        ... 41 more
Caused by: org.jetbrains.org.objectweb.asm.tree.analysis.AnalyzerException: Error at instruction 9: Third argument: expected R, but found I
        at org.jetbrains.org.objectweb.asm.tree.analysis.Analyzer.analyze(Analyzer.java:291)
        at org.jetbrains.kotlin.codegen.optimization.transformer.MethodTransformer.runAnalyzer(MethodTransformer.java:32)
        at org.jetbrains.kotlin.codegen.optimization.transformer.MethodTransformer.analyze(MethodTransformer.java:45)
        at org.jetbrains.kotlin.codegen.optimization.MethodVerifier.transform(MethodVerifier.kt:26)
        ... 44 more
Caused by: org.jetbrains.org.objectweb.asm.tree.analysis.AnalyzerException: Third argument: expected R, but found I
        at org.jetbrains.org.objectweb.asm.tree.analysis.BasicVerifier.ternaryOperation(BasicVerifier.java:368)
        at org.jetbrains.org.objectweb.asm.tree.analysis.BasicVerifier.ternaryOperation(BasicVerifier.java:43)
        at org.jetbrains.org.objectweb.asm.tree.analysis.Frame.execute(Frame.java:321)
        at org.jetbrains.org.objectweb.asm.tree.analysis.Analyzer.analyze(Analyzer.java:187)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	124,
	"KT-43846",
	"Kotlin",
	"kotlinc",
	"No smart cast when returning function closures with captured smart-cast variable",
	"https://youtrack.jetbrains.com/issue/KT-43846",
	"inference",
	NULL,
	NULL,
	"Submitted",
	NULL,
	"2020-12-09 12:25:55.486000",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"fun foo(x: Any): String {
    if (x is String) {
        val thunk = {x}
        return thunk()
    }
    return ""str""
}",
	"program.kt:4:16: error: type mismatch: inferred type is Any but String was expected
        return thunk()"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	125,
	"KT-44082",
	"Kotlin",
	"kotlinc",
	"Can not infer type of overridden function",
	"https://youtrack.jetbrains.com/issue/KT-44082",
	"inference",
	NULL,
	NULL,
	"Open",
	NULL,
	"2020-12-24 16:17:53.655000",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"interface R<T>
interface W
interface J
open class A
open class B: A(), R<W>
open class E: A(), R<J>
open class C {
    open fun foo(): A = B()
}
class D: C() {
    override fun foo() = if (true) B() else E()
}
val x = if (true) B() else E() // Inferred type of x is Any",
	"return type of ''foo'' is not a subtype of the return type of the overridden member ''public open fun foo(): A defined in C''"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	126,
	"KT-44742",
	"Kotlin",
	"kotlinc",
	"Wrong java.io.Serializable inferred",
	"https://youtrack.jetbrains.com/issue/KT-44742",
	"inference",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-02-05 16:30:39.072000",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"fun main() {
    val x = if (true) 1 as Number else false // inferred type is java.io.Serializable
    x == 1
}",
	"program.kt:3:7: error: no method ''equals(Any?): Boolean'' available
    x == 1
      ^
program.kt:3:7: error: unresolved reference: ==
    x == 1
      ^"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	127,
	"KT-47530",
	"Kotlin",
	"kotlinc",
	"NI: Unexpected TYPE_MISMATCH when combining nested conditional and contravariant type argument",
	"https://youtrack.jetbrains.com/issue/KT-47530",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-06-30 08:07:41.415000",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"class Foo<T>
fun main() {
    val x: Foo<in Long> =
      if (true) Foo<Long>()
      else
        if (true) Foo<Long>()
        else Foo<Number>()
}",
	"test.kt:7:9: error: type mismatch: inferred type is Foo<out Number> but Foo<in Long> was expected
        if (true) Foo<Long>()
        ^"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	128,
	"KT-44595",
	"Kotlin",
	"kotlinc",
	"Cannot infer type of overridden function with generic",
	"https://youtrack.jetbrains.com/issue/KT-44595",
	"inference",
	NULL,
	NULL,
	"Closed",
	"As Designed",
	"2021-01-28 14:10:00.384000",
	"2021-09-08 14:41:21.774000",
	"Unexpected Compile-Time Error",
	"223 days, 0:31:21.390000",
	"class X<T> (val x: T)
open class A {
    open fun foo(): X<A> =
       X(A())
} 
class B: A() {
    override fun foo() =
      X(B())
}",
	"error: return type of ''foo'' is not a subtype of the return type of the overridden member ''public open fun foo(): X<A> defined in A''
    override fun foo() =
                 ^"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	129,
	"KT-47508",
	"Kotlin",
	"kotlinc",
	"TYPE_MISMATCH when combining use-site variance with bounded polymorphism",
	"https://youtrack.jetbrains.com/issue/KT-47508",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-06-28 17:01:07.446000",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"open class A
open class B: A()
class C : B()
class Foo<T : A>(val x: T)
fun main() {
    val x: Foo<in C> = TODO()
    val y: A = x.x
}",
	"text
test.kt:10:16: error: type mismatch: inferred type is Any? but A was expected
    val y: A = x.x"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	130,
	"KT-47458",
	"Kotlin",
	"kotlinc",
	"Superfluous TYPE_MISMATCH when instantiating type constructor with bounded type parameters",
	"https://youtrack.jetbrains.com/issue/KT-47458",
	"soundness",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-06-25 11:26:41.359000",
	"None",
	"Unexpected Runtime Behavior",
	"None",
	"class Foo<out Y, Z: Y>
open class A
class B : A()
fun main() {
    val x: Foo<A, in A> = Foo<B, B>()
}",
	"test.kt:7:27: error: type mismatch: inferred type is A but B was expected
    val x: Foo<A, in A> = Foo<B, B>()
test.kt:7:27: error: type mismatch: inferred type is Foo<B, B> but Foo<A, in A> was expected
    val x: Foo<A, in A> = Foo<B, B>()"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	131,
	"KT-47231",
	"Kotlin",
	"kotlinc",
	"NI: Wrong type is inferred on combining conditional and contravariant type argument",
	"https://youtrack.jetbrains.com/issue/KT-47231",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-06-10 13:33:17.025000",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"class Foo<T>
class Bar(val x : Foo<in Float>)
fun main() {
    val x: Foo<in Float> = Foo<Float>()
    val y: Foo<in Float> = Foo<Float>()
    Bar(x) // works
    val z = if (true) x else y
    Bar(z) // works
    Bar(if (true) x else y) // fails
}",
	"test.kt:12:9: error: type mismatch: inferred type is Foo<out Any?> but Foo<in Float> was expected
    Bar(if (true) x else y) // fails
        ^"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	132,
	"KT-46662",
	"Kotlin",
	"kotlinc",
	"False positive ""NOTHING_TO_OVERRIDE"" when combining varargs with type parameters",
	"https://youtrack.jetbrains.com/issue/KT-46662",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-05-13 12:40:42.338000",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"open class A<T> {
    open fun foo(vararg x: T) {}
}
class B: A<Float>() {
    override fun foo(vararg x: Float) {} // NOTHING_TO_OVERRIDE
}",
	"console
test.kt:7:5: error: ''foo'' overrides nothing
    override fun foo(vararg x: Float) {}
    ^"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	133,
	"KT-44551",
	"Kotlin",
	"kotlinc",
	"Imprecise type is inferred in an if expression",
	"https://youtrack.jetbrains.com/issue/KT-44551",
	"inference",
	NULL,
	NULL,
	"Closed",
	"As Designed",
	"2021-01-26 16:12:12.924000",
	"2021-09-08 14:10:30.232000",
	"Unexpected Compile-Time Error",
	"224 days, 21:58:17.308000",
	"   open class A
   open class B: A()
   class X<T: A>(val x: T)
   fun foo(x: X<A>) = {}
   val tmp = if (true) X<A>(A()) else X(B())
   fun main() {
       foo(tmp)
   }",
	"program.kt:9:9: error: type mismatch: inferred type is X<out A> but X<A> was expected
    foo(temp)
        ^"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	134,
	"KT-43806",
	"Kotlin",
	"kotlinc",
	"""Unexpected tokens"" when `if` statement contains double parenthesis in variable assignment",
	"https://youtrack.jetbrains.com/issue/KT-43806",
	"generator",
	NULL,
	NULL,
	"Submitted",
	NULL,
	"2020-12-07 16:01:57.207000",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	" val b = 98 < (if ((""bar"" > ""foo"")) 5 else 1)",
	"val b = 98 < (if ((""bar"" > ""foo"")) 5 else 1)
              ^
program.kt:1:17: error: expecting comma or '')''
val b = 98 < (if ((""bar"" > ""foo"")) 5 else 1)
                ^
program.kt:1:18: error: expecting '')''
val b = 98 < (if ((""bar"" > ""foo"")) 5 else 1)
                 ^
program.kt:1:19: error: expecting ''->'' to specify return type of a function type
val b = 98 < (if ((""bar"" > ""foo"")) 5 else 1)
                  ^
program.kt:1:20: error: type expected
val b = 98 < (if ((""bar"" > ""foo"")) 5 else 1)
                   ^
program.kt:1:21: error: expecting comma or '')''
val b = 98 < (if ((""bar"" > ""foo"")) 5 else 1)
                    ^
program.kt:1:21: error: expecting '')''
val b = 98 < (if ((""bar"" > ""foo"")) 5 else 1)
                    ^
program.kt:1:24: error: expecting ''->'' to specify return type of a function type
val b = 98 < (if ((""bar"" > ""foo"")) 5 else 1)
                       ^
program.kt:1:26: error: type expected
val b = 98 < (if ((""bar"" > ""foo"")) 5 else 1)
                         ^
program.kt:1:28: error: property getter or setter expected
val b = 98 < (if ((""bar"" > ""foo"")) 5 else 1)
                           ^
program.kt:1:9: error: expression ''98'' of type ''Int'' cannot be invoked as a function. The function ''invoke()'' is not found
val b = 98 < (if ((""bar"" > ""foo"")) 5 else 1)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	135,
	"KT-46864",
	"Kotlin",
	"kotlinc",
	"JVM IR: ""IndexOutOfBoundsException: Cannot pop operand off an empty stack"" on compiling unused identity equality of Double literals",
	"https://youtrack.jetbrains.com/issue/KT-46864",
	"generator",
	NULL,
	NULL,
	"Closed",
	"Fixed",
	"2021-05-21 12:30:34.659000",
	"2021-05-31 18:29:14.949000",
	"crash",
	"10 days, 5:58:40.290000",
	"fun m(): Unit
{
  (40.523 !== 62.562)
}",
	"stacktrace
exception: org.jetbrains.kotlin.codegen.CompilationException: Back-end (JVM) Internal error: Couldn''t transform method node:
m ()V:
   L0
    LINENUMBER 3 L0
    NOP
    POP2
   L1
    LINENUMBER 4 L1
    RETURN
   L2
    MAXSTACK = 4
    MAXLOCALS = 0
File is unknown
The root cause org.jetbrains.org.objectweb.asm.tree.analysis.AnalyzerException was thrown at: org.jetbrains.org.objectweb.asm.tree.analysis.Analyzer.analyze(Analyzer.java:295)
        at org.jetbrains.kotlin.codegen.TransformationMethodVisitor.visitEnd(TransformationMethodVisitor.kt:92)
        at org.jetbrains.org.objectweb.asm.MethodVisitor.visitEnd(MethodVisitor.java:782)
        at org.jetbrains.org.objectweb.asm.tree.MethodNode.accept(MethodNode.java:772)
        at org.jetbrains.kotlin.backend.jvm.codegen.ClassCodegen.generateMethod(ClassCodegen.kt:392)
        at org.jetbrains.kotlin.backend.jvm.codegen.ClassCodegen.generate(ClassCodegen.kt:128)
        at org.jetbrains.kotlin.backend.jvm.JvmIrCodegenFactory.doGenerateFilesInternal(JvmIrCodegenFactory.kt:206)
        at org.jetbrains.kotlin.backend.jvm.JvmIrCodegenFactory.generateModule(JvmIrCodegenFactory.kt:62)
        at org.jetbrains.kotlin.codegen.KotlinCodegenFacade.compileCorrectFiles(KotlinCodegenFacade.java:35)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.generate(KotlinToJVMBytecodeCompiler.kt:592)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli(KotlinToJVMBytecodeCompiler.kt:212)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli$default(KotlinToJVMBytecodeCompiler.kt:155)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:169)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:52)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:88)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:44)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:98)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:76)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:45)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit(CLITool.kt:227)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit$default(CLITool.kt:222)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMain(CLITool.kt:214)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler$Companion.main(K2JVMCompiler.kt:271)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.main(K2JVMCompiler.kt)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:566)
        at org.jetbrains.kotlin.preloading.Preloader.run(Preloader.java:87)
        at org.jetbrains.kotlin.preloading.Preloader.main(Preloader.java:44)
Caused by: org.jetbrains.org.objectweb.asm.tree.analysis.AnalyzerException: Error at instruction 3: Cannot pop operand off an empty stack.
        at org.jetbrains.org.objectweb.asm.tree.analysis.Analyzer.analyze(Analyzer.java:295)
        at org.jetbrains.kotlin.codegen.optimization.boxing.PopBackwardPropagationTransformer$Transformer.analyzeMethodBody(PopBackwardPropagationTransformer.kt:80)
        at org.jetbrains.kotlin.codegen.optimization.boxing.PopBackwardPropagationTransformer$Transformer.access$analyzeMethodBody(PopBackwardPropagationTransformer.kt:41)
        at org.jetbrains.kotlin.codegen.optimization.boxing.PopBackwardPropagationTransformer$Transformer$frames$2.invoke(PopBackwardPropagationTransformer.kt:67)
        at org.jetbrains.kotlin.codegen.optimization.boxing.PopBackwardPropagationTransformer$Transformer$frames$2.invoke(PopBackwardPropagationTransformer.kt:67)
        at kotlin.SynchronizedLazyImpl.getValue(LazyJVM.kt:74)
        at org.jetbrains.kotlin.codegen.optimization.boxing.PopBackwardPropagationTransformer$Transformer.getFrames(PopBackwardPropagationTransformer.kt:67)
        at org.jetbrains.kotlin.codegen.optimization.boxing.PopBackwardPropagationTransformer$Transformer.computeTransformations(PopBackwardPropagationTransformer.kt:172)
        at org.jetbrains.kotlin.codegen.optimization.boxing.PopBackwardPropagationTransformer$Transformer.transform(PopBackwardPropagationTransformer.kt:72)
        at org.jetbrains.kotlin.codegen.optimization.boxing.PopBackwardPropagationTransformer.transform(PopBackwardPropagationTransformer.kt:38)
        at org.jetbrains.kotlin.codegen.optimization.transformer.CompositeMethodTransformer.transform(CompositeMethodTransformer.kt:25)
        at org.jetbrains.kotlin.codegen.optimization.OptimizationMethodVisitor.performTransformations(OptimizationMethodVisitor.kt:66)
        at org.jetbrains.kotlin.codegen.TransformationMethodVisitor.visitEnd(TransformationMethodVisitor.kt:70)
        ... 28 more
Caused by: java.lang.IndexOutOfBoundsException: Cannot pop operand off an empty stack.
        at org.jetbrains.org.objectweb.asm.tree.analysis.Frame.pop(Frame.java:228)
        at org.jetbrains.org.objectweb.asm.tree.analysis.Frame.execute(Frame.java:329)
        at org.jetbrains.org.objectweb.asm.tree.analysis.Analyzer.analyze(Analyzer.java:187)
        ... 40 more"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	136,
	"KT-47184",
	"Kotlin",
	"kotlinc",
	"NI: Can not infer type of an if expression when passed in a function call and used a type parameter variable",
	"https://youtrack.jetbrains.com/issue/KT-47184",
	"inference",
	NULL,
	NULL,
	"Submitted",
	NULL,
	"2021-06-08 13:07:19.547000",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"class Test<T: Byte> {
    fun test(z: T) {
        val y: Byte = if (true) z else 1 // works
        val x = bar(if (true) z else 1) // fails
    }
    fun bar(x: Byte) {}
}",
	"test.kt:4:21: error: type mismatch: inferred type is T but Int was expected
        val x = bar(if (true) z else 1) // fails
                    ^
test.kt:4:21: error: type mismatch: inferred type is Int but Byte was expected
        val x = bar(if (true) z else 1) // fails"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	137,
	"KT-47117",
	"Kotlin",
	"kotlinc",
	"NI: Reporting misleading error message when initializing a type constructor with unresolved reference",
	"https://youtrack.jetbrains.com/issue/KT-47117",
	"soundness",
	NULL,
	NULL,
	"Submitted",
	NULL,
	"2021-06-03 12:21:13.309000",
	"None",
	"Unexpected Runtime Behavior",
	"None",
	"class Foo<J>() {}
class Bar<H, N>(val x: Foo<N>) {}
fun foo(): Unit
{
  val y = Bar<Any, Any>(Foo<N>())
}",
	"foo.kt:7:11: error: not enough information to infer type variable H
  val y = Bar<Any, Any>(Foo<N>())
          ^
foo.kt:7:29: error: unresolved reference: N
  val y = Bar<Any, Any>(Foo<N>())"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	138,
	"KT-47073",
	"Kotlin",
	"kotlinc",
	"JVM IR: ""AnalyzerException: Argument 1: expected I, but found R"" on compiling a method with a generic default argument whose bound is a primitive",
	"https://youtrack.jetbrains.com/issue/KT-47073",
	"generator",
	NULL,
	NULL,
	"Closed",
	"Fixed",
	"2021-06-01 09:28:28.758000",
	"2021-06-04 17:57:56.024000",
	"crash",
	"3 days, 8:29:27.266000",
	"class Test<T: Char> {
  fun foo(): String {
    fun nested(x: T = TODO()): String {
      return ""str""
    }
    return nested()
  }
}",
	"stacktrace
exception: org.jetbrains.kotlin.codegen.CompilationException: Back-end (JVM) Internal error: Couldn''t transform method node:
foo ()Ljava/lang/String;:
  @Lorg/jetbrains/annotations/NotNull;() // invisible
   L0
    LINENUMBER 6 L0
    ACONST_NULL
    ICONST_1
    ACONST_NULL
    INVOKESTATIC Test.foo$nested$default (CILjava/lang/Object;)Ljava/lang/String;
    ARETURN
   L1
    NOP
   L2
    LOCALVARIABLE this LTest; L0 L2 0
    MAXSTACK = 3
    MAXLOCALS = 1
File is unknown
The root cause java.lang.AssertionError was thrown at: org.jetbrains.kotlin.codegen.optimization.MethodVerifier.transform(MethodVerifier.kt:28)
        at org.jetbrains.kotlin.codegen.TransformationMethodVisitor.visitEnd(TransformationMethodVisitor.kt:92)
        at org.jetbrains.org.objectweb.asm.MethodVisitor.visitEnd(MethodVisitor.java:782)
        at org.jetbrains.org.objectweb.asm.tree.MethodNode.accept(MethodNode.java:772)
        at org.jetbrains.kotlin.backend.jvm.codegen.ClassCodegen.generateMethod(ClassCodegen.kt:392)
        at org.jetbrains.kotlin.backend.jvm.codegen.ClassCodegen.generate(ClassCodegen.kt:128)
        at org.jetbrains.kotlin.backend.jvm.JvmIrCodegenFactory.doGenerateFilesInternal(JvmIrCodegenFactory.kt:206)
        at org.jetbrains.kotlin.backend.jvm.JvmIrCodegenFactory.generateModule(JvmIrCodegenFactory.kt:62)
        at org.jetbrains.kotlin.codegen.KotlinCodegenFacade.compileCorrectFiles(KotlinCodegenFacade.java:35)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.generate(KotlinToJVMBytecodeCompiler.kt:592)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli(KotlinToJVMBytecodeCompiler.kt:212)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli$default(KotlinToJVMBytecodeCompiler.kt:155)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:169)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:52)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:88)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:44)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:98)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:76)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:45)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit(CLITool.kt:227)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit$default(CLITool.kt:222)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMain(CLITool.kt:214)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler$Companion.main(K2JVMCompiler.kt:271)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.main(K2JVMCompiler.kt)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:566)
        at org.jetbrains.kotlin.preloading.Preloader.run(Preloader.java:87)
        at org.jetbrains.kotlin.preloading.Preloader.main(Preloader.java:44)
Caused by: java.lang.AssertionError: AFTER mandatory stack transformations: incorrect bytecode
        at org.jetbrains.kotlin.codegen.optimization.MethodVerifier.transform(MethodVerifier.kt:28)
        at org.jetbrains.kotlin.codegen.optimization.transformer.CompositeMethodTransformer.transform(CompositeMethodTransformer.kt:25)
        at org.jetbrains.kotlin.codegen.optimization.OptimizationMethodVisitor.performTransformations(OptimizationMethodVisitor.kt:62)
        at org.jetbrains.kotlin.codegen.TransformationMethodVisitor.visitEnd(TransformationMethodVisitor.kt:70)
        ... 28 more
Caused by: org.jetbrains.org.objectweb.asm.tree.analysis.AnalyzerException: Error at instruction 5: Argument 1: expected I, but found R
        at org.jetbrains.org.objectweb.asm.tree.analysis.Analyzer.analyze(Analyzer.java:291)
        at org.jetbrains.kotlin.codegen.optimization.transformer.MethodTransformer.runAnalyzer(MethodTransformer.java:32)
        at org.jetbrains.kotlin.codegen.optimization.transformer.MethodTransformer.analyze(MethodTransformer.java:45)
        at org.jetbrains.kotlin.codegen.optimization.MethodVerifier.transform(MethodVerifier.kt:26)
        ... 31 more
Caused by: org.jetbrains.org.objectweb.asm.tree.analysis.AnalyzerException: Argument 1: expected I, but found R
        at org.jetbrains.org.objectweb.asm.tree.analysis.BasicVerifier.naryOperation(BasicVerifier.java:402)
        at org.jetbrains.org.objectweb.asm.tree.analysis.BasicVerifier.naryOperation(BasicVerifier.java:43)
        at org.jetbrains.org.objectweb.asm.tree.analysis.Frame.executeInvokeInsn(Frame.java:648)
        at org.jetbrains.org.objectweb.asm.tree.analysis.Frame.execute(Frame.java:573)
        at org.jetbrains.org.objectweb.asm.tree.analysis.Analyzer.analyze(Analyzer.java:187)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	139,
	"KT-46684",
	"Kotlin",
	"kotlinc",
	"ClassCastException when calling a function with a nullable generic vararg parameter",
	"https://youtrack.jetbrains.com/issue/KT-46684",
	"inference",
	NULL,
	NULL,
	"Closed",
	"Duplicate",
	"2021-05-14 09:49:19.291000",
	"2021-05-14 10:25:44.981000",
	"crash",
	"0:36:25.690000",
	"class Test {
    fun foo() {
        m(""str"", null);
    }
    fun <T: Number> m(obj: Any, vararg t: T?) {
        println(""here"")
    }
}
fun main() {
    Test().foo()
}",
	"stacktrace
Exception in thread ""main"" java.lang.ClassCastException: class [Ljava.lang.Void; cannot be cast to class [Ljava.lang.Number; ([Ljava.lang.Void; and [Ljava.lang.Number; are in module java.base of loader ''bootstrap'')
        at Test.foo(test.kt:4)
        at TestKt.main(test.kt:14)
        at TestKt.main(test.kt)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	140,
	"KT-45339",
	"Kotlin",
	"kotlinc",
	"IllegalStateException through `PositioningStrategies$SECONDARY_CONSTRUCTOR_DELEGATION_CALL$1.mark` caused by inner enum",
	"https://youtrack.jetbrains.com/issue/KT-45339",
	"generator",
	NULL,
	NULL,
	"Closed",
	"Fixed",
	"2021-03-07 13:52:55.735000",
	"2021-03-24 12:28:05.680000",
	"crash",
	"16 days, 22:35:09.945000",
	"interface Foo<T> {
    inner enum class Bar : Foo<T>
}",
	"stacktrace
exception: java.lang.IllegalStateException: unexpected element REFERENCE_EXPRESSION
        at org.jetbrains.kotlin.diagnostics.PositioningStrategies$SECONDARY_CONSTRUCTOR_DELEGATION_CALL$1.mark(PositioningStrategies.kt:630)
        at org.jetbrains.kotlin.diagnostics.PositioningStrategy.markDiagnostic(PositioningStrategy.kt:30)
        at org.jetbrains.kotlin.diagnostics.DiagnosticFactoryWithPsiElement.getTextRanges(DiagnosticFactoryWithPsiElement.java:33)
        at org.jetbrains.kotlin.diagnostics.AbstractDiagnostic.getTextRanges(AbstractDiagnostic.java:67)
        at org.jetbrains.kotlin.diagnostics.DiagnosticUtils.lambda$sortedDiagnostics$1(DiagnosticUtils.java:133)
        at java.base/java.util.TimSort.countRunAndMakeAscending(TimSort.java:355)
        at java.base/java.util.TimSort.sort(TimSort.java:220)
        at java.base/java.util.Arrays.sort(Arrays.java:1515)
        at java.base/java.util.ArrayList.sort(ArrayList.java:1750)
        at org.jetbrains.kotlin.diagnostics.DiagnosticUtils.sortedDiagnostics(DiagnosticUtils.java:125)
        at org.jetbrains.kotlin.cli.common.messages.AnalyzerWithCompilerReport$Companion.reportDiagnostics(AnalyzerWithCompilerReport.kt:158)
        at org.jetbrains.kotlin.cli.common.messages.AnalyzerWithCompilerReport$Companion.reportDiagnostics(AnalyzerWithCompilerReport.kt:166)
        at org.jetbrains.kotlin.cli.common.messages.AnalyzerWithCompilerReport.analyzeAndReport(AnalyzerWithCompilerReport.kt:121)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.analyze(KotlinToJVMBytecodeCompiler.kt:508)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli(KotlinToJVMBytecodeCompiler.kt:188)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli$default(KotlinToJVMBytecodeCompiler.kt:154)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:169)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:52)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:88)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:44)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:98)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:76)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:45)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit(CLITool.kt:227)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit$default(CLITool.kt:222)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMain(CLITool.kt:214)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler$Companion.main(K2JVMCompiler.kt:271)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.main(K2JVMCompiler.kt)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:566)
        at org.jetbrains.kotlin.preloading.Preloader.run(Preloader.java:87)
        at org.jetbrains.kotlin.preloading.Preloader.main(Preloader.java:44)"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	141,
	"KT-44651",
	"Kotlin",
	"kotlinc",
	"JVM / IR: ""IllegalStateException: Illegal type substitutor"" with if-else inside class constructor argument inside another if-else",
	"https://youtrack.jetbrains.com/issue/KT-44651",
	"inference",
	NULL,
	NULL,
	"Closed",
	"Fixed",
	"2021-02-01 12:26:10.176000",
	"2021-02-11 09:41:04.700000",
	"crash",
	"9 days, 21:14:54.524000",
	"class X<T: Number>(val y: Any, val x: T)
fun main() {
  val num: Long = -10
  val num2: Int = 20
  val obj = if (true)
      X(Any(), if (true) num else num2)
    else
      X(Any(), -25)
   val f = obj.y
}",
	"stacktrace
exception: org.jetbrains.kotlin.backend.common.BackendException: Backend Internal error: Exception during psi2ir
File being compiled: (13,12) in test.kt
The root cause java.lang.IllegalStateException was thrown at: org.jetbrains.kotlin.resolve.calls.inference.components.NewTypeSubstitutor$DefaultImpls.throwExceptionAboutInvalidCapturedSubstitution(NewTypeSubstitutor.kt:169)
Illegal type substitutor: org.jetbrains.kotlin.types.AlternativeTypeSubstitutionKt$substituteAlternativesInPublicType$substitutor$1@15d42b6f, because for captured type ''CapturedType(out {Comparable<Nothing> & Number})'' supertype approximation should be null, but it is: ''{Comparable<Nothing> & Number}'',original supertype: ''Number'': KtDotQualifiedExpression:
obj.y
        at org.jetbrains.kotlin.backend.common.CodegenUtil.reportBackendException(CodegenUtil.kt:239)
        at org.jetbrains.kotlin.psi2ir.generators.DeclarationGenerator.generateMemberDeclaration(DeclarationGenerator.kt:75)
        at org.jetbrains.kotlin.psi2ir.generators.ModuleGenerator.generateSingleFile(ModuleGenerator.kt:83)
        at org.jetbrains.kotlin.psi2ir.generators.ModuleGenerator.generateModuleFragment(ModuleGenerator.kt:50)
        at org.jetbrains.kotlin.psi2ir.Psi2IrTranslator.generateModuleFragment(Psi2IrTranslator.kt:81)
        at org.jetbrains.kotlin.backend.jvm.JvmIrCodegenFactory.convertToIr(JvmIrCodegenFactory.kt:131)
        at org.jetbrains.kotlin.backend.jvm.JvmIrCodegenFactory.convertToIr$default(JvmIrCodegenFactory.kt:61)
        at org.jetbrains.kotlin.backend.jvm.JvmIrCodegenFactory.generateModule(JvmIrCodegenFactory.kt:56)
        at org.jetbrains.kotlin.codegen.KotlinCodegenFacade.compileCorrectFiles(KotlinCodegenFacade.java:35)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.generate(KotlinToJVMBytecodeCompiler.kt:595)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli(KotlinToJVMBytecodeCompiler.kt:211)
        at org.jetbrains.kotlin.cli.jvm.compiler.KotlinToJVMBytecodeCompiler.compileModules$cli$default(KotlinToJVMBytecodeCompiler.kt:154)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:169)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.doExecute(K2JVMCompiler.kt:52)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:88)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:44)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:98)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:76)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:45)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit(CLITool.kt:227)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit$default(CLITool.kt:222)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMain(CLITool.kt:214)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler$Companion.main(K2JVMCompiler.kt:271)
        at org.jetbrains.kotlin.cli.jvm.K2JVMCompiler.main(K2JVMCompiler.kt)
        at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke(Method.java:498)
        at org.jetbrains.kotlin.preloading.Preloader.run(Preloader.java:87)
        at org.jetbrains.kotlin.preloading.Preloader.main(Preloader.java:44)
Caused by: java.lang.IllegalStateException: Illegal type substitutor: org.jetbrains.kotlin.types.AlternativeTypeSubstitutionKt$substituteAlternativesInPublicType$substitutor$1@15d42b6f, because for captured type ''CapturedType(out {Comparable<Nothing> & Number})'' supertype approximation should be null, but it is: ''{Comparable<Nothing> & Number}'',original supertype: ''Number''
        at org.jetbrains.kotlin.resolve.calls.inference.components.NewTypeSubstitutor$DefaultImpls.throwExceptionAboutInvalidCapturedSubstitution(NewTypeSubstitutor.kt:169)
        at org.jetbrains.kotlin.resolve.calls.inference.components.NewTypeSubstitutor$DefaultImpls.substitute(NewTypeSubstitutor.kt:118)
        at org.jetbrains.kotlin.resolve.calls.inference.components.NewTypeSubstitutor$DefaultImpls.substitute(NewTypeSubstitutor.kt:50)
        at org.jetbrains.kotlin.resolve.calls.inference.components.NewTypeSubstitutor$DefaultImpls.substituteParametrizedType(NewTypeSubstitutor.kt:200)
        at org.jetbrains.kotlin.resolve.calls.inference.components.NewTypeSubstitutor$DefaultImpls.substitute(NewTypeSubstitutor.kt:89)
        at org.jetbrains.kotlin.resolve.calls.inference.components.NewTypeSubstitutor$DefaultImpls.substitute(NewTypeSubstitutor.kt:50)
        at org.jetbrains.kotlin.resolve.calls.inference.components.NewTypeSubstitutor$DefaultImpls.safeSubstitute(NewTypeSubstitutor.kt:22)
        at org.jetbrains.kotlin.types.AlternativeTypeSubstitutionKt$substituteAlternativesInPublicType$substitutor$1.safeSubstitute(alternativeTypeSubstitution.kt:12)
        at org.jetbrains.kotlin.types.AlternativeTypeSubstitutionKt.substituteAlternativesInPublicType(alternativeTypeSubstitution.kt:28)
        at org.jetbrains.kotlin.types.TypeApproximator.approximateDeclarationType(TypeApproximator.kt:29)
        at org.jetbrains.kotlin.ir.util.TypeTranslator.approximateByKotlinRules(TypeTranslator.kt:195)
        at org.jetbrains.kotlin.ir.util.TypeTranslator.approximate(TypeTranslator.kt:174)
        at org.jetbrains.kotlin.ir.util.TypeTranslator.translateType(TypeTranslator.kt:83)
        at org.jetbrains.kotlin.ir.util.TypeTranslator.translateType(TypeTranslator.kt:80)
        at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.toIrType(StatementGenerator.kt:64)
        at org.jetbrains.kotlin.psi2ir.generators.ArgumentsGenerationUtilsKt.generateReceiver(ArgumentsGenerationUtils.kt:75)
        at org.jetbrains.kotlin.psi2ir.generators.ArgumentsGenerationUtilsKt.generateReceiver(ArgumentsGenerationUtils.kt:67)
        at org.jetbrains.kotlin.psi2ir.generators.ArgumentsGenerationUtilsKt.generateReceiverOrNull(ArgumentsGenerationUtils.kt:64)
        at org.jetbrains.kotlin.psi2ir.generators.ArgumentsGenerationUtilsKt.generateCallReceiver(ArgumentsGenerationUtils.kt:209)
        at org.jetbrains.kotlin.psi2ir.generators.ArgumentsGenerationUtilsKt.generateCallReceiver$default(ArgumentsGenerationUtils.kt:180)
        at org.jetbrains.kotlin.psi2ir.generators.ArgumentsGenerationUtilsKt.pregenerateCallReceivers(ArgumentsGenerationUtils.kt:667)
        at org.jetbrains.kotlin.psi2ir.generators.ArgumentsGenerationUtilsKt.pregenerateCallUsing(ArgumentsGenerationUtils.kt:448)
        at org.jetbrains.kotlin.psi2ir.generators.ArgumentsGenerationUtilsKt.pregenerateCall(ArgumentsGenerationUtils.kt:439)
        at org.jetbrains.kotlin.psi2ir.generators.CallGenerator.generateValueReference(CallGenerator.kt:102)
        at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.generateExpressionForReferencedDescriptor(StatementGenerator.kt:329)
        at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.visitSimpleNameExpression(StatementGenerator.kt:313)
        at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.visitSimpleNameExpression(StatementGenerator.kt:52)
        at org.jetbrains.kotlin.psi.KtNameReferenceExpression.accept(KtNameReferenceExpression.kt:59)
        at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.visitDotQualifiedExpression(StatementGenerator.kt:373)
        at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.visitDotQualifiedExpression(StatementGenerator.kt:52)
        at org.jetbrains.kotlin.psi.KtDotQualifiedExpression.accept(KtDotQualifiedExpression.kt:32)
        at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.genStmt(StatementGenerator.kt:77)
        at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.genExpr(StatementGenerator.kt:87)
        at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.visitProperty(StatementGenerator.kt:111)
        at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.visitProperty(StatementGenerator.kt:52)
        at org.jetbrains.kotlin.psi.KtProperty.accept(KtProperty.java:58)
        at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.genStmt(StatementGenerator.kt:77)
        at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.generateStatement(StatementGenerator.kt:67)
        at org.jetbrains.kotlin.psi2ir.generators.StatementGenerator.generateStatements(StatementGenerator.kt:70)
        at org.jetbrains.kotlin.psi2ir.generators.BodyGenerator.generateFunctionBody(BodyGenerator.kt:59)
        at org.jetbrains.kotlin.psi2ir.generators.FunctionGenerator.generateFunctionDeclaration(FunctionGenerator.kt:50)
        at org.jetbrains.kotlin.psi2ir.generators.DeclarationGenerator.generateMemberDeclaration(DeclarationGenerator.kt:49)
        ... 28 more"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	142,
	"KT-44627",
	"Kotlin",
	"kotlinc",
	"JVM IR: ACCIDENTAL_OVERRIDE when overriding a generic field where the type parameter has a primitive bound",
	"https://youtrack.jetbrains.com/issue/KT-44627",
	"generator",
	NULL,
	NULL,
	"Closed",
	"Fixed",
	"2021-01-30 08:00:52.316000",
	"2021-02-15 16:35:34.067000",
	"Unexpected Compile-Time Error",
	"16 days, 8:34:41.751000",
	"open class A<T: Char>(open var x: T)
open class B<T: Char>(open override var x: T): A<T>(x)
class C(override var x: Char): B<Char>(''x'')",
	"error: accidental override: The following declarations have the same JVM signature (getX()Ljava/lang/Character;):
    fun <get-x>(): Char defined in C
    fun getX(): Char defined in C
class C(override var x: Char): B<Char>(''x'')
        ^"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	143,
	"JDK-8276081",
	"Java",
	"javac",
	"Unexpected compile-time error when combining generic function and function ref",
	"https://bugs.openjdk.java.net/browse/JDK-8276081",
	"generator",
	NULL,
	NULL,
	"New",
	NULL,
	"2021-10-22 21:36:45+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"import java.util.function.Function;
class Foo {
    public static <Y> String m(String x) {
        return x;
    }
}
class Test {
    <T> void foo(String x, Function<T, String> y) {}
    void test() {
        foo(""F"", Foo::m);
    }
}",
	" error: incompatible types: cannot infer type-variable(s) T "
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	144,
	"JDK-8274183",
	"Java",
	"javac",
	"StackOverflowError on computing the GLB",
	"https://bugs.openjdk.java.net/browse/JDK-8274183",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-09-22 09:42:10+00:00",
	"None",
	"crash",
	"None",
	"class Main {
  static public final C<? super A<Double>> test() {
    final C<? super A<Double>> x = null;
    x.f = null;
    return x;
  }
}
class A<T> {}
abstract class B<F, B extends F> {}
abstract class C<N extends A<Number>> {
  public B<? extends N, ? extends N> f;
}",
	""
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	145,
	"JDK-8272077",
	"Java",
	"javac",
	"Cannot assign method reference to Generic Function Interface",
	"https://bugs.openjdk.java.net/browse/JDK-8272077",
	"generator",
	NULL,
	NULL,
	"Closed",
	"Not an Issue",
	"2021-07-28 10:43:17+00:00",
	"2021-08-06 07:07:30+00:00",
	"Unexpected Compile-Time Error",
	"8 days, 20:24:13",
	"class Test {
  public static Short foo(Short x) {
      return x;
  }
  public static Short bar() {
      Short x = 1;
      return x;
  }
  public static void main(String[] args) {
    Function0<? extends Number> f = Test::bar;
    Function1<? extends Number, ? extends Number> f1 = (Short x) -> x; // works
    Function1<? extends Number, ? extends Number> f2 = Test::foo; // does not work
  }
}
interface Function0<R> {
  public R apply();
}
interface Function1<P, R> {
  public R apply(P x);
}
  public static Short bar() {
      Short x = 1;
      return x;
  }
  public static void main(String[] args) {
    Function0<? extends Number> f = Test::bar;
    Function1<? extends Number, ? extends Number> f1 = (Short x) -> x; // works
    Function1<? extends Short, ? extends Number> f2 = Test::foo; // does not work
  }
}
interface Function0<R> {
  public R apply();
}
interface Function1<P, R> {
  public R apply(P x);
}",
	"Test.java:15: error: incompatible types: invalid method reference 
    Function1<? extends Number, ? extends Number> f2 = Test::foo; // does not work
                                                       ^ 
    incompatible types: Number cannot be converted to Short "
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	146,
	"JDK-8269738",
	"Java",
	"javac",
	"AssertionError when combining pattern matching and function closure",
	"https://bugs.openjdk.java.net/browse/JDK-8269738",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-06-30 12:20:10+00:00",
	"2021-07-08 14:15:55+00:00",
	"crash",
	"8 days, 1:55:45",
	"import java.util.function.Supplier;
class Test {
    static A x = null;
    static char tmp = (
        (Test.x instanceof B b) ? ((Supplier<B>) () -> b).get() : null
     ).field;
}
class A {}
class B extends A {
    char field = ''d'';
}",
	""
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	147,
	"JDK-8269737",
	"Java",
	"javac",
	"Wrong Type-Argument inference in presence of bounds and use-site variance",
	"https://bugs.openjdk.java.net/browse/JDK-8269737",
	"inference",
	NULL,
	NULL,
	"Closed",
	"Not an Issue",
	"2021-06-28 16:52:53+00:00",
	"2021-07-01 08:22:02+00:00",
	"Unexpected Compile-Time Error",
	"2 days, 15:29:09",
	"abstract class Cls<T1> {
  public Cls() {}
}
abstract class Cls2<T2> extends Cls<T2> {
  public Cls2() {}
}
abstract class Cls3<T3 extends Float> extends Cls2<T3> {
  public Cls3() {}
}
abstract class Cls4<T4 extends Cls3<? super Float>> {
  public Cls4() {}
}
final class Cls5 {
  public Cls5() {}
  public final Cls4<? extends Cls3<Float>> foo() {
    Cls4<? extends Cls3<Float>> y = (Cls4<? extends Cls3<Float>>) null;
    var x = y;
    // Cls4<? extends Cls3<Float>> x = y; // This works
    return x;
  }
}",
	"Cls.java:23: error: incompatible types: Cls4<CAP#1> cannot be converted to Cls4<? extends Cls3<Float>> 
   return x; 
          ^ 
 where CAP#1 is a fresh type-variable: 
    CAP#1 extends Cls3<? super Float> from capture of ? 
1 error"
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	148,
	"JDK-8269586",
	"Java",
	"javac",
	"Compile-time error when using wildcard as type argument",
	"https://bugs.openjdk.java.net/browse/JDK-8269586",
	"generator",
	NULL,
	NULL,
	"Resolved",
	"Not an Issue",
	"2021-06-24 14:11:17+00:00",
	"2021-09-16 20:05:37+00:00",
	"Unexpected Compile-Time Error",
	"84 days, 5:54:20",
	"abstract class ClsA<M> {
  public ClsA() {}
}
class ClsB<X, Y extends ClsA<? super X>> {
  public ClsB() {
    super();
  }
}
class ClsC {
  public ClsC() {
    super();
  }
  public final void foo(ClsB<? extends Integer, ? extends ClsA<Integer>> bar) {}
}",
	"ClsA.java:15: error: type argument ? extends ClsA<Integer> is not within bounds of type-variable Y 
 public final void foo(ClsB<? extends Integer, ? extends ClsA<Integer>> bar) {} 
                                                ^ 
  where Y,X are type-variables: 
   Y extends ClsA<? super X> declared in class ClsB 
  X extends Object declared in class ClsB 
1 error "
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	149,
	"JDK-8269386",
	"Java",
	"javac",
	"Imprecise type inference in the presence of ternary operator and wildcard",
	"https://bugs.openjdk.java.net/browse/JDK-8269386",
	"inference",
	NULL,
	NULL,
	"Closed",
	"Not an Issue",
	"2021-06-24 14:36:46+00:00",
	"2021-06-28 19:30:49+00:00",
	"Unexpected Compile-Time Error",
	"4 days, 4:54:03",
	"class A<T> {
  public A() {}
  public B<? super T> foo() {
    var x = (true) ? new B<T>() : (B<? super T>) null;
    return x;
    //return (true) ? new B<T>() : (B<? super T>) null;  // This works
  }
}
class B<T> {
  public B() {}
}",
	"A.java:5: error: incompatible types: B<CAP#1> cannot be converted to B<? super T>
    return x; 
           ^ 
  where T is a type-variable: 
    T extends Object declared in class A 
  where CAP#1 is a fresh type-variable: 
    CAP#1 extends Object from capture of ? extends Object 
1 error "
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	150,
	"JDK-8269348",
	"Java",
	"javac",
	"Wrong type inference in presence of a generic with bound to Double",
	"https://bugs.openjdk.java.net/browse/JDK-8269348",
	"inference",
	NULL,
	NULL,
	"Resolved",
	"Not an Issue",
	"2021-06-23 14:02:54+00:00",
	"2021-06-30 15:12:56+00:00",
	"Unexpected Compile-Time Error",
	"7 days, 1:10:02",
	"class Test<T extends Double, K extends T> {
  public T test() {
    T foo = (T) null;
    final var v = ((true) ?
      foo :
       (K) null);
    return v;
  }
}",
	"Test.java:7: error: incompatible types: double cannot be converted to T 
    return v; 
           ^ 
  where T is a type-variable: 
    T extends Double declared in class Test 
1 error "
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	151,
	"JDK-8268159",
	"Java",
	"javac",
	"Misleading report with type variables when extending one of the type arguments",
	"https://bugs.openjdk.java.net/browse/JDK-8268159",
	"generator",
	NULL,
	NULL,
	"Open",
	NULL,
	"2021-06-02 13:44:00+00:00",
	"None",
	"Unexpected Compile-Time Error",
	"None",
	"class Foo<T1, T2 extends Number> {}
class Bar<T1, T2> {
    Foo<T1, T1> x;
}",
	""
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	152,
	"JDK-8267610",
	"Java",
	"javac",
	"NPE at at jdk.compiler/com.sun.tools.javac.jvm.Code.emitop",
	"https://bugs.openjdk.java.net/browse/JDK-8267610",
	"soundness",
	NULL,
	NULL,
	"Resolved",
	"Fixed",
	"2021-05-20 11:27:23+00:00",
	"2021-06-24 23:08:30+00:00",
	"crash",
	"35 days, 11:41:07",
	"import java.util.function.Supplier;
class Main {
  public Integer foo(Object x) {
    Integer bar = 1;
    return ((x instanceof Number y) ?
        ((Supplier<Integer>) (() -> {
          return ((y instanceof Integer z) ? z : bar);
        })).get() : bar);
  }
}",
	""
);

INSERT INTO "CompilerBug" (
	"bid", "bug_id", "language", "compiler", "title",
	"issue_tracker_link", "mutator", "fix_link", "severity", "status",
	"resolution", "report_date", "resolution_date", "symptom",
	"resolved_in", "test", "error_msg"
) VALUES (
	153,
	"JDK-8267220",
	"Java",
	"javac",
	"javac crashes at com.sun.tools.javac.code.Types$7.visitType with AssertionError",
	"https://bugs.openjdk.java.net/browse/JDK-8267220",
	"generator",
	NULL,
	NULL,
	"Closed",
	"Duplicate",
	"2021-05-14 12:18:50+00:00",
	"2021-05-17 06:06:17+00:00",
	"crash",
	"2 days, 17:47:27",
	"public class Test
{
  static final Double foo() {
    Double bar = 1.1;
    return ((true) ? bar : (Double) (() -> 10.0));
  }
}",
	""
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	1,
	1,
	1
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	2,
	2,
	1
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	3,
	4,
	1
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	4,
	5,
	1
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	5,
	1,
	2
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	6,
	7,
	2
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	7,
	2,
	2
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	8,
	4,
	2
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	9,
	3,
	3
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	10,
	1,
	4
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	11,
	2,
	4
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	12,
	5,
	4
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	13,
	1,
	5
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	14,
	5,
	5
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	15,
	21,
	5
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	16,
	1,
	6
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	17,
	5,
	6
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	18,
	21,
	6
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	19,
	1,
	7
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	20,
	2,
	7
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	21,
	7,
	7
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	22,
	4,
	7
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	23,
	5,
	7
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	24,
	10,
	7
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	25,
	8,
	7
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	26,
	1,
	8
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	27,
	2,
	8
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	28,
	5,
	8
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	29,
	2,
	9
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	30,
	4,
	9
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	31,
	3,
	9
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	32,
	5,
	9
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	33,
	17,
	9
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	34,
	1,
	10
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	35,
	5,
	10
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	36,
	7,
	10
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	37,
	8,
	10
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	38,
	9,
	10
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	39,
	2,
	10
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	40,
	9,
	11
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	41,
	10,
	12
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	42,
	8,
	13
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	43,
	7,
	13
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	44,
	1,
	13
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	45,
	2,
	13
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	46,
	10,
	13
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	47,
	17,
	13
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	48,
	13,
	14
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	49,
	16,
	14
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	50,
	17,
	14
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	51,
	22,
	15
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	52,
	24,
	15
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	53,
	13,
	15
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	54,
	1,
	16
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	55,
	2,
	16
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	56,
	4,
	16
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	57,
	21,
	16
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	58,
	1,
	17
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	59,
	2,
	17
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	60,
	22,
	17
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	61,
	21,
	17
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	62,
	3,
	17
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	63,
	5,
	17
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	64,
	4,
	17
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	65,
	1,
	18
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	66,
	5,
	18
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	67,
	22,
	18
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	68,
	2,
	18
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	69,
	21,
	18
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	70,
	1,
	19
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	71,
	3,
	19
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	72,
	5,
	19
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	73,
	2,
	19
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	74,
	21,
	19
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	75,
	3,
	20
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	76,
	21,
	20
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	77,
	1,
	21
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	78,
	2,
	21
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	79,
	4,
	21
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	80,
	16,
	22
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	81,
	14,
	22
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	82,
	13,
	22
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	83,
	17,
	23
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	84,
	1,
	23
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	85,
	2,
	23
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	86,
	1,
	24
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	87,
	13,
	24
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	88,
	14,
	24
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	89,
	16,
	24
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	90,
	1,
	25
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	91,
	2,
	25
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	92,
	3,
	25
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	93,
	21,
	25
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	94,
	1,
	26
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	95,
	2,
	26
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	96,
	3,
	26
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	97,
	1,
	27
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	98,
	2,
	27
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	99,
	3,
	27
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	100,
	21,
	27
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	101,
	1,
	28
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	102,
	2,
	28
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	103,
	3,
	28
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	104,
	1,
	29
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	105,
	2,
	29
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	106,
	21,
	29
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	107,
	22,
	29
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	108,
	1,
	30
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	109,
	2,
	30
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	110,
	3,
	30
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	111,
	1,
	31
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	112,
	2,
	31
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	113,
	3,
	31
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	114,
	4,
	31
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	115,
	21,
	31
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	116,
	1,
	32
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	117,
	2,
	32
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	118,
	1,
	33
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	119,
	2,
	33
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	120,
	13,
	33
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	121,
	22,
	33
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	122,
	13,
	34
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	123,
	16,
	34
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	124,
	9,
	34
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	125,
	10,
	34
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	126,
	22,
	35
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	127,
	24,
	35
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	128,
	1,
	36
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	129,
	2,
	36
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	130,
	13,
	36
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	131,
	21,
	36
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	132,
	22,
	36
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	133,
	1,
	37
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	134,
	2,
	37
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	135,
	4,
	37
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	136,
	5,
	37
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	137,
	1,
	38
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	138,
	2,
	38
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	139,
	13,
	39
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	140,
	16,
	39
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	141,
	16,
	40
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	142,
	17,
	40
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	143,
	13,
	40
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	144,
	13,
	41
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	145,
	16,
	41
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	146,
	17,
	41
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	147,
	16,
	42
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	148,
	13,
	42
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	149,
	1,
	42
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	150,
	2,
	42
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	151,
	16,
	43
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	152,
	14,
	43
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	153,
	22,
	43
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	154,
	13,
	43
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	155,
	1,
	44
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	156,
	5,
	44
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	157,
	1,
	45
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	158,
	2,
	45
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	159,
	4,
	45
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	160,
	1,
	46
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	161,
	21,
	46
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	162,
	2,
	46
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	163,
	16,
	47
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	164,
	22,
	47
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	165,
	13,
	47
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	166,
	1,
	48
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	167,
	2,
	48
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	168,
	5,
	48
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	169,
	17,
	48
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	170,
	21,
	48
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	171,
	16,
	49
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	172,
	13,
	49
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	173,
	1,
	50
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	174,
	3,
	50
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	175,
	5,
	50
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	176,
	21,
	50
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	177,
	7,
	50
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	178,
	9,
	50
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	179,
	3,
	51
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	180,
	1,
	51
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	181,
	2,
	51
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	182,
	5,
	51
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	183,
	7,
	51
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	184,
	8,
	51
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	185,
	17,
	51
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	186,
	1,
	52
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	187,
	2,
	52
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	188,
	21,
	52
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	189,
	1,
	53
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	190,
	2,
	53
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	191,
	7,
	53
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	192,
	9,
	53
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	193,
	17,
	53
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	194,
	1,
	54
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	195,
	3,
	54
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	196,
	5,
	54
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	197,
	2,
	54
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	198,
	17,
	54
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	199,
	1,
	55
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	200,
	2,
	55
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	201,
	3,
	55
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	202,
	5,
	55
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	203,
	9,
	55
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	204,
	17,
	55
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	205,
	3,
	56
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	206,
	1,
	56
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	207,
	1,
	57
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	208,
	5,
	57
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	209,
	16,
	57
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	210,
	13,
	57
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	211,
	22,
	57
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	212,
	1,
	58
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	213,
	5,
	58
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	214,
	4,
	58
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	215,
	2,
	58
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	216,
	1,
	59
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	217,
	2,
	59
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	218,
	5,
	59
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	219,
	17,
	59
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	220,
	1,
	60
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	221,
	2,
	60
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	222,
	4,
	60
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	223,
	5,
	60
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	224,
	7,
	60
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	225,
	9,
	60
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	226,
	7,
	61
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	227,
	9,
	61
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	228,
	24,
	61
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	229,
	17,
	61
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	230,
	18,
	61
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	231,
	1,
	62
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	232,
	5,
	62
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	233,
	7,
	62
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	234,
	18,
	62
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	235,
	2,
	62
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	236,
	16,
	63
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	237,
	10,
	63
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	238,
	9,
	63
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	239,
	13,
	63
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	240,
	1,
	64
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	241,
	2,
	64
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	242,
	7,
	64
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	243,
	5,
	64
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	244,
	1,
	65
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	245,
	5,
	65
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	246,
	1,
	66
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	247,
	2,
	66
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	248,
	1,
	67
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	249,
	5,
	67
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	250,
	21,
	68
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	251,
	17,
	68
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	252,
	2,
	68
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	253,
	1,
	68
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	254,
	1,
	69
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	255,
	5,
	69
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	256,
	1,
	70
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	257,
	2,
	70
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	258,
	5,
	70
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	259,
	9,
	70
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	260,
	18,
	70
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	261,
	1,
	71
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	262,
	5,
	71
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	263,
	1,
	72
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	264,
	20,
	72
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	265,
	3,
	72
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	266,
	5,
	72
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	267,
	14,
	72
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	268,
	16,
	72
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	269,
	18,
	72
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	270,
	1,
	73
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	271,
	5,
	73
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	272,
	16,
	73
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	273,
	13,
	73
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	274,
	24,
	74
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	275,
	9,
	74
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	276,
	17,
	74
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	277,
	7,
	74
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	278,
	17,
	75
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	279,
	10,
	75
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	280,
	26,
	76
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	281,
	10,
	77
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	282,
	1,
	78
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	283,
	2,
	78
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	284,
	7,
	78
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	285,
	9,
	78
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	286,
	13,
	78
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	287,
	16,
	78
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	288,
	10,
	79
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	289,
	1,
	80
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	290,
	2,
	80
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	291,
	20,
	80
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	292,
	21,
	80
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	293,
	7,
	81
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	294,
	9,
	81
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	295,
	13,
	81
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	296,
	16,
	81
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	297,
	10,
	82
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	298,
	17,
	82
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	299,
	21,
	83
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	300,
	13,
	83
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	301,
	1,
	83
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	302,
	2,
	83
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	303,
	18,
	83
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	304,
	9,
	83
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	305,
	10,
	84
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	306,
	7,
	85
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	307,
	14,
	85
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	308,
	16,
	85
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	309,
	1,
	86
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	310,
	2,
	86
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	311,
	7,
	86
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	312,
	21,
	86
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	313,
	24,
	86
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	314,
	1,
	87
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	315,
	2,
	87
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	316,
	21,
	87
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	317,
	7,
	87
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	318,
	22,
	87
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	319,
	9,
	87
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	320,
	1,
	88
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	321,
	2,
	88
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	322,
	5,
	88
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	323,
	21,
	88
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	324,
	13,
	88
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	325,
	16,
	88
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	326,
	18,
	89
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	327,
	18,
	90
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	328,
	19,
	90
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	329,
	18,
	91
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	330,
	1,
	92
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	331,
	2,
	92
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	332,
	21,
	92
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	333,
	1,
	93
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	334,
	2,
	93
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	335,
	7,
	93
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	336,
	9,
	93
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	337,
	21,
	93
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	338,
	17,
	93
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	339,
	1,
	95
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	340,
	2,
	95
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	341,
	21,
	95
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	342,
	17,
	95
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	343,
	1,
	96
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	344,
	5,
	96
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	345,
	13,
	96
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	346,
	21,
	96
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	347,
	7,
	97
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	348,
	9,
	97
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	349,
	24,
	97
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	350,
	1,
	98
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	351,
	2,
	98
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	352,
	21,
	98
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	353,
	7,
	99
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	354,
	1,
	100
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	355,
	9,
	100
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	356,
	7,
	100
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	357,
	2,
	100
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	358,
	21,
	100
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	359,
	22,
	101
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	360,
	24,
	101
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	361,
	17,
	101
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	362,
	1,
	102
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	363,
	2,
	102
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	364,
	1,
	103
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	365,
	2,
	103
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	366,
	21,
	103
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	367,
	1,
	104
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	368,
	2,
	104
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	369,
	1,
	105
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	370,
	2,
	105
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	371,
	7,
	105
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	372,
	22,
	107
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	373,
	9,
	107
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	374,
	1,
	108
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	375,
	5,
	108
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	376,
	22,
	108
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	377,
	13,
	108
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	378,
	24,
	109
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	379,
	13,
	110
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	380,
	24,
	110
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	381,
	22,
	110
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	382,
	15,
	111
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	383,
	16,
	111
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	384,
	14,
	111
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	385,
	13,
	111
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	386,
	1,
	112
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	387,
	2,
	112
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	388,
	3,
	112
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	389,
	5,
	112
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	390,
	21,
	112
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	391,
	9,
	112
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	392,
	1,
	113
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	393,
	5,
	113
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	394,
	4,
	113
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	395,
	2,
	113
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	396,
	3,
	113
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	397,
	21,
	113
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	398,
	25,
	114
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	399,
	7,
	114
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	400,
	17,
	114
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	401,
	9,
	114
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	402,
	18,
	115
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	403,
	17,
	115
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	404,
	22,
	115
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	405,
	16,
	116
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	406,
	13,
	116
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	407,
	25,
	116
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	408,
	9,
	116
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	409,
	3,
	117
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	410,
	16,
	117
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	411,
	15,
	118
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	412,
	13,
	118
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	413,
	14,
	118
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	414,
	16,
	118
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	415,
	1,
	119
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	416,
	2,
	119
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	417,
	5,
	119
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	418,
	6,
	119
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	419,
	22,
	119
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	420,
	4,
	119
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	421,
	15,
	120
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	422,
	3,
	120
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	423,
	13,
	120
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	424,
	15,
	121
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	425,
	1,
	121
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	426,
	13,
	121
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	427,
	18,
	122
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	428,
	9,
	122
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	429,
	9,
	123
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	430,
	18,
	123
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	431,
	24,
	124
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	432,
	22,
	124
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	433,
	13,
	124
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	434,
	1,
	125
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	435,
	2,
	125
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	436,
	7,
	125
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	437,
	9,
	125
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	438,
	25,
	125
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	439,
	8,
	125
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	440,
	17,
	125
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	441,
	9,
	126
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	442,
	17,
	126
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	443,
	1,
	127
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	444,
	2,
	127
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	445,
	4,
	127
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	446,
	17,
	127
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	447,
	9,
	127
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	448,
	1,
	128
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	449,
	2,
	128
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	450,
	7,
	128
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	451,
	8,
	128
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	452,
	21,
	128
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	453,
	25,
	128
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	454,
	7,
	129
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	455,
	1,
	129
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	456,
	2,
	129
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	457,
	4,
	129
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	458,
	5,
	129
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	459,
	9,
	129
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	460,
	1,
	130
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	461,
	6,
	130
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	462,
	5,
	130
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	463,
	4,
	130
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	464,
	2,
	130
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	465,
	7,
	130
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	466,
	1,
	131
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	467,
	2,
	131
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	468,
	4,
	131
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	469,
	1,
	132
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	470,
	2,
	132
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	471,
	7,
	132
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	472,
	8,
	132
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	473,
	20,
	132
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	474,
	1,
	133
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	475,
	2,
	133
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	476,
	7,
	133
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	477,
	5,
	133
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	478,
	9,
	133
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	479,
	17,
	133
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	480,
	21,
	133
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	481,
	22,
	133
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	482,
	17,
	134
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	483,
	1,
	136
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	484,
	5,
	136
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	485,
	22,
	136
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	486,
	1,
	137
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	487,
	2,
	137
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	488,
	1,
	138
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	489,
	5,
	138
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	490,
	5,
	139
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	491,
	3,
	139
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	492,
	21,
	139
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	493,
	20,
	139
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	494,
	1,
	140
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	495,
	1,
	141
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	496,
	5,
	141
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	497,
	2,
	141
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	498,
	21,
	141
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	499,
	22,
	141
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	500,
	17,
	141
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	501,
	1,
	142
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	502,
	2,
	142
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	503,
	7,
	142
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	504,
	8,
	142
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	505,
	5,
	142
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	506,
	16,
	143
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	507,
	3,
	143
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	508,
	14,
	143
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	509,
	1,
	144
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	510,
	2,
	144
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	511,
	5,
	144
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	512,
	4,
	144
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	513,
	15,
	145
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	514,
	16,
	145
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	515,
	4,
	145
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	516,
	13,
	145
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	517,
	9,
	145
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	518,
	14,
	145
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	519,
	16,
	146
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	520,
	24,
	146
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	521,
	13,
	146
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	522,
	1,
	147
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	523,
	2,
	147
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	524,
	5,
	147
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	525,
	4,
	147
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	526,
	7,
	147
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	527,
	22,
	147
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	528,
	1,
	148
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	529,
	2,
	148
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	530,
	5,
	148
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	531,
	4,
	148
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	532,
	1,
	149
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	533,
	2,
	149
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	534,
	4,
	149
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	535,
	17,
	149
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	536,
	22,
	149
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	537,
	1,
	150
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	538,
	5,
	150
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	539,
	17,
	150
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	540,
	22,
	150
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	541,
	1,
	151
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	542,
	2,
	151
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	543,
	5,
	151
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	544,
	16,
	152
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	545,
	24,
	152
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	546,
	13,
	152
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	547,
	17,
	152
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	548,
	17,
	153
);

INSERT INTO "CompilerBugCharacteristics" (
	"bcid", "cid", "bid"
) VALUES (
	549,
	13,
	153
);

