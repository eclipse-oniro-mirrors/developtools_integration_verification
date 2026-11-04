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
 * Java equivalent for ArkTS 17.16.1 Destructuring Assignment tests
 * Java does NOT have native array/tuple destructuring syntax.
 * Must use manual element access instead.
 * Java 21
 *
 * @since 2025
 */
import java.util.ArrayList;
import java.util.List;

/**
 * Java equivalent for ArkTS 17.16.1 Destructuring Assignment tests.
 * Java does NOT have native destructuring syntax - uses manual element access.
 *
 * @since 2025
 */
public class JavaDestructuring {
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

        printSummary(passCount, failCount);
    }

    static boolean test1() {
        int[] arr = {10, 20, 30};
        int a = arr[0];
        int b = arr[1];
        if (a == 10 && b == 20) {
            System.out.println("PASS: test1 manual array extract a=" + a + " b=" + b);
            return true;
        } else {
            System.out.println("FAIL: test1");
            return false;
        }
    }

    static boolean test2() {
        int[] arr = {100, 200, 300};
        int first = arr[0];
        // skip arr[1]
        int third = arr[2];
        if (first == 100 && third == 300) {
            System.out.println("PASS: test2 skip element first=" + first + " third=" + third);
            return true;
        } else {
            System.out.println("FAIL: test2");
            return false;
        }
    }

    static boolean test3() {
        List<Object> tup = new ArrayList<>();
        tup.add(42);
        tup.add("hello");
        if (!(tup.get(0) instanceof Integer) || !(tup.get(1) instanceof String)) {
            System.out.println("FAIL: test3 type mismatch");
            return false;
        }
        int num = (Integer) tup.get(0);
        String str = (String) tup.get(1);
        if (num == 42 && str.equals("hello")) {
            System.out.println("PASS: test3 tuple equivalent num=" + num + " str=" + str);
            return true;
        } else {
            System.out.println("FAIL: test3");
            return false;
        }
    }

    static boolean test4() {
        int[] arr = {99};
        int val = arr[0];
        if (val == 99) {
            System.out.println("PASS: test4 single element val=" + val);
            return true;
        } else {
            System.out.println("FAIL: test4");
            return false;
        }
    }

    static boolean test5() {
        String[] arr = {"alpha", "beta", "gamma"};
        String first = arr[0];
        String third = arr[2];
        if (first.equals("alpha") && third.equals("gamma")) {
            System.out.println("PASS: test5 string array first=" + first + " third=" + third);
            return true;
        } else {
            System.out.println("FAIL: test5");
            return false;
        }
    }

    static void printSummary(int passCount, int failCount) {
        System.out.println();
        System.out.println("--- KEY DIFFERENCES ---");
        System.out.println("ArkTS: let [a, b] = arr          | Java: int a = arr[0]; int b = arr[1]");
        System.out.println("ArkTS: let [a, , b] = arr        | Java: int a = arr[0]; int b = arr[2]");
        System.out.println("ArkTS: let [num, str] = tup      | Java: Object[] + manual cast (no tuple type)");
        System.out.println("ArkTS: let [a, ...rest] = arr    | Java: N/A (no rest in destructuring)");
        System.out.println("ArkTS: let [[a,b],[c,d]] = arr   | Java: N/A (no nested destructuring)");
        System.out.println();
        System.out.println("=== SUMMARY: " + passCount + " passed, " + failCount + " failed ===");
        if (failCount > 0) {
            System.exit(1);
        }
    }
}
