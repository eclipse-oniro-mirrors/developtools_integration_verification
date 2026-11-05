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
 * Java equivalent of EXP2_17_08_013_RUNTIME_LOOP_EXECUTION
 * Tests: for/while/do-while loops, break, continue
 *
 * @since 2025
 */
public class JavaLoopExecution {
    public static void main(String[] args) {
        // Test for loop: sum 0 to 9 = 45
        int sumFor = 0;
        for (int i = 0; i < 10; i++) {
            sumFor += i;
        }
        assert sumFor == 45 : "for loop sum assertion failed: " + sumFor;

        // Test while loop: count to 5
        int countWhile = 0;
        while (countWhile < 5) {
            countWhile++;
        }
        assert countWhile == 5 : "while loop assertion failed: " + countWhile;

        // Test do-while: executes at least once
        int doCount = 0;
        boolean condition = false;
        do {
            doCount++;
        } while (condition);
        assert doCount == 1 : "do-while assertion failed: " + doCount;

        // Test break in while
        int breakCount = 0;
        while (true) {
            breakCount++;
            if (breakCount >= 3) {
                break;
            }
        }
        assert breakCount == 3 : "break assertion failed: " + breakCount;

        // Test continue in for: sum of odd numbers 0-9
        int oddSum = 0;
        for (int j = 0; j < 10; j++) {
            if (j % 2 == 0) {
                continue;
            }
            oddSum += j;
        }
        assert oddSum == 25 : "continue assertion failed: " + oddSum;

        System.out.println("verified");
    }
}
