/*
 * Copyright (c) 2021-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/**
 * Java equivalent of ArkTS §17.7.1 Callable Types with $_invoke Method.
 *
 * KEY DIFFERENCE: Java does NOT support making a class name directly callable.
 * There is no equivalent to ArkTS `ClassName(args)` calling $_invoke.
 *
 * The closest Java analog is:
 *   - Static factory methods (the normal Java way)
 *   - Functional interfaces + method references
 *   - But ClassName() as a call expression does NOT exist in Java
 *
 * This file demonstrates what IS possible in Java and what IS NOT.
 */

// Case 1: Static method (the normal Java pattern �?no callable type)
class SimpleInvoke {
    /**
     * Static invoke
     */
    public static void invoke() {
        System.out.println("SimpleInvoke called");
    }
    // Java: SimpleInvoke.invoke() works, but SimpleInvoke() does NOT compile
}

// Case 2: Static method with params �?Java's equivalent of $_invoke with params
class Calculator {
    /**
     * Static invoke with int params
     *
     * @param a first param
     * @param b second param
     * @return int result
     */
    public static int invoke(int a, int b) {
        return a + b;
    }

    /**
     * Static invoke with String params
     *
     * @param a first string
     * @param b second string
     * @return String concatenated
     */
    public static String invoke(String a, String b) {
        return a + b;
    }
    // Java: Calculator.invoke(2,3) works, but Calculator(2,3) does NOT
}

// Case 3: Functional interface + static method reference (closest to callable)
// This is NOT the same as calling the class name, but it's the closest Java has
@FunctionalInterface
interface IntBinaryOp {
    /**
     * Apply binary operation
     *
     * @param a first operand
     * @param b second operand
     * @return int result
     */
    int apply(int a, int b);
}

class MathOp {
    /**
     * Static add
     *
     * @param a first operand
     * @param b second operand
     * @return int sum
     */
    public static int add(int a, int b) {
        return a + b;
    }

    /**
     * Static multiply
     *
     * @param a first operand
     * @param b second operand
     * @return int product
     */
    public static int multiply(int a, int b) {
        return a * b;
    }
    // Method reference: IntBinaryOp op = MathOp::add; op.apply(2,3) => 5
    // But MathOp(2,3) is still NOT valid Java
}

// Case 4: No equivalent to "both $_invoke and $_instantiate" error
// Java doesn't have these special method names, so this concept is N/A

// Case 5: No equivalent to instance $_invoke not making class callable
// In Java, you NEVER call a class name as a function

// Case 6: Generic class static method �?Java DOES allow using type params in static? NO
// Actually Java also forbids static methods from using class type parameters
class GenericInvokeJava<T> {
    // public static T invoke(T value) { return value; } // COMPILE ERROR: non-static type T
    /**
     * Static invoke without type param
     *
     * @param x input value
     * @return int result
     */
    public static int invoke(int x) {
        return x + 1;
    } // OK, no type param used
}

/**
 * Java equivalent of ArkTS §17.7.1 Callable Types
 */
public class JavaInvokeCallable {
    public static void main(String[] args) {
        boolean allPassed = true;

        // Test 1: Normal static method call (the Java way)
        SimpleInvoke.invoke();

        // Test 2: Calculator static methods
        int r1 = Calculator.invoke(2, 3);
        if (r1 != 5) {
            System.out.println("FAIL: Calculator.invoke(2,3) = " + r1 + " expected 5");
            allPassed = false;
        }

        String r2 = Calculator.invoke("Hello", "World");
        if (!r2.equals("HelloWorld")) {
            System.out.println("FAIL: Calculator.invoke(Hello,World) = " + r2 + " expected HelloWorld");
            allPassed = false;
        }

        // Test 3: Method reference (closest to ArkTS callable)
        IntBinaryOp op = MathOp::add;
        int r3 = op.apply(10, 20);
        if (r3 != 30) {
            System.out.println("FAIL: op.apply(10,20) = " + r3 + " expected 30");
            allPassed = false;
        }

        // Test 4: Generic class static method without type param
        int r4 = GenericInvokeJava.invoke(100);
        if (r4 != 101) {
            System.out.println("FAIL: GenericInvokeJava.invoke(100) = " + r4 + " expected 101");
            allPassed = false;
        }

        if (allPassed) {
            System.out.println("All Java assertions passed");
        } else {
            System.exit(1);
        }
    }
}
