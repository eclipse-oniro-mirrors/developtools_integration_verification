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
 * Java equivalent for ArkTS 17.16 Pattern Matching tests
 * Tests: instanceof operator, type testing, branching
 * Java 21
 */

class Animal {
    String name = "animal";
}
class Dog extends Animal {
    void bark() {
        System.out.println("woof");
    }
}
class Cat extends Animal {
    void meow() {
        System.out.println("meow");
    }
}
class Fruit {
    String name = "fruit";
}
class Apple extends Fruit {
    String color = "red";
}
class Banana extends Fruit {
    String color = "yellow";
}

/**
 * Java equivalent for ArkTS 17.16 Pattern Matching tests
 */
public class JavaPatternMatching {
    static String identify(Fruit f) {
        if (f instanceof Apple) {
            return "apple";
        } else if (f instanceof Banana) {
            return "banana";
        } else {
            return "unknown";
        }
    }

    public static void main(String[] args) {
        int passCount = 0;
        int failCount = 0;

        if (test1()) {
            passCount++;
        } else {
            failCount++;
        }
        if (test2()) {
            passCount++;
        } else {
            failCount++;
        }
        if (test3()) {
            passCount++;
        } else {
            failCount++;
        }
        if (test4()) {
            passCount++;
        } else {
            failCount++;
        }
        if (test5()) {
            passCount++;
        } else {
            failCount++;
        }
        if (test6()) {
            passCount++;
        } else {
            failCount++;
        }

        System.out.println();
        System.out.println("=== SUMMARY: " + passCount + " passed, " + failCount + " failed ===");
        if (failCount > 0) {
            System.exit(1);
        }
    }

    static boolean test1() {
        Object obj = "hello";
        if (!(obj instanceof String)) {
            System.out.println("FAIL: test1 instanceof String");
            return false;
        }
        System.out.println("PASS: test1 instanceof String");
        if (obj instanceof Number) {
            System.out.println("FAIL: test1 should not be Number");
            return false;
        }
        System.out.println("PASS: test1 not instanceof Number");
        return true;
    }

    static boolean test2() {
        Animal v = new Dog();
        if (!(v instanceof Animal)) {
            System.out.println("FAIL: test2 Dog instanceof Animal");
            return false;
        }
        System.out.println("PASS: test2 Dog instanceof Animal");
        if (!(v instanceof Dog)) {
            System.out.println("FAIL: test2 Dog instanceof Dog");
            return false;
        }
        System.out.println("PASS: test2 Dog instanceof Dog");
        if (v instanceof Cat) {
            System.out.println("FAIL: test2 Dog should not be Cat");
            return false;
        }
        System.out.println("PASS: test2 Dog not instanceof Cat");
        Animal v2 = new Animal();
        if (v2 instanceof Dog) {
            System.out.println("FAIL: test2 Animal should not be Dog");
            return false;
        }
        System.out.println("PASS: test2 Animal not instanceof Dog");
        return true;
    }

    static boolean test3() {
        Apple a = new Apple();
        Banana b = new Banana();
        Fruit u = new Fruit();
        if (!identify(a).equals("apple")) {
            System.out.println("FAIL: test3 Apple not identified, got: " + identify(a));
            return false;
        }
        System.out.println("PASS: test3 Apple identified");
        if (!identify(b).equals("banana")) {
            System.out.println("FAIL: test3 Banana not identified, got: " + identify(b));
            return false;
        }
        System.out.println("PASS: test3 Banana identified");
        if (!identify(u).equals("unknown")) {
            System.out.println("FAIL: test3 unknown not identified");
            return false;
        }
        System.out.println("PASS: test3 unknown identified");
        return true;
    }

    static boolean test4() {
        Object nullObj = null;
        if (nullObj instanceof String) {
            System.out.println("FAIL: test4 null instanceof String should be false");
            return false;
        }
        System.out.println("PASS: test4 null not instanceof String");
        Object strObj = "world";
        if (!(strObj instanceof String)) {
            System.out.println("FAIL: test4 'world' should be instanceof String");
            return false;
        }
        System.out.println("PASS: test4 'world' instanceof String");
        return true;
    }

    static boolean test5() {
        System.out.println("INFO: test5 Java rejects instanceof int at compile time");
        System.out.println("      (different from ArkTS which only warns W1001506)");
        return true;
    }

    static boolean test6() {
        Object x = "pattern";
        if (x instanceof String s) {
            if (s.length() > 0) {
                System.out.println("PASS: test6 Java pattern matching with binding");
                return true;
            }
        }
        System.out.println("FAIL: test6 pattern matching with binding");
        return false;
    }
}
