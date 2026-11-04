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
 * Java equivalent of ArkTS compile-pass basic statements
 * Tests: if-else, while, do-while, for, try-catch-finally, return, switch, break, continue
 *
 * @since 2025
 */
public class JavaBasicStatements {
    public static void main(String[] args) {
        testIfElse();
        testWhile();
        testDoWhile();
        testForLoop();
        testSwitch();
        testBreakContinue();
        testReturn();
        testTryCatch();
        System.out.println("all basic statements verified");
    }

    static void testIfElse() {
        int x = 10;
        int y = 20;
        if (x > 5) {
            int tmp = x + 1;
        }
        if (x > y) {
            int tmp = x - y;
        } else {
            int tmp = y - x;
        }
        if (x > y) {
            int tmp = x;
        } else if (x < y) {
            int tmp = y;
        } else {
            int tmp = 0;
        }
        if (x > 0) {
            if (y > 0) {
                int tmp = x + y;
            }
        }
    }

    static void testWhile() {
        int count = 0;
        while (count < 10) {
            count++;
        }
        int i = 0;
        while (true) {
            i++;
            if (i >= 10) {
                break;
            }
        }
    }

    static void testDoWhile() {
        int count = 0;
        do {
            count++;
        } while (count < 5);
        int j = 0;
        do {
            j++;
            if (j >= 3) {
                break;
            }
        } while (true);
    }

    static void testForLoop() {
        int sum = 0;
        for (int i = 0; i < 10; i++) {
            sum += i;
        }
        for (int k = 0; k < 100; k++) {
            if (k >= 5) {
                break;
            }
        }
    }

    static void testSwitch() {
        int day = 3;
        String dayName = "unknown";
        switch (day) {
            case 1: dayName = "Monday"; break;
            case 2: dayName = "Tuesday"; break;
            case 3: dayName = "Wednesday"; break;
            default: dayName = "other"; break;
        }
        String color = "red";
        int code = 0;
        switch (color) {
            case "red": code = 0xFF0000; break;
            case "green": code = 0x00FF00; break;
            default: code = 0; break;
        }
    }

    static void testBreakContinue() {
        int a = 0;
        while (a < 10) {
            a++;
            if (a == 5) {
                break;
            }
        }
        int sum1 = 0;
        int c = 0;
        while (c < 10) {
            c++;
            if (c % 2 == 0) {
                continue;
            }
            sum1 += c;
        }
    }

    static void testReturn() {
        // void return
        return;
    }

    static void testTryCatch() {
        try {
            int x = 10 / 2;
        } catch (ArithmeticException e) {
            String msg = "error caught";
        }
        try {
            int val = 100;
        } catch (ArithmeticException e) {
            String msg = "caught";
        } finally {
            boolean finalStep = true;
        }
    }
}
