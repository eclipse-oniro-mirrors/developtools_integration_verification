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
 * Java equivalent of EXP2_17_08_014_RUNTIME_FOR_OF_ITERATION
 * Tests: for-each iteration over arrays, strings (char iteration), break
 *
 * @since 2025
 */
public class JavaForEachIteration {
    public static void main(String[] args) {
        // Test for-each with int array
        int[] numbers = {10, 20, 30, 40, 50};
        int sumArr = 0;
        for (int num : numbers) {
            sumArr += num;
        }
        assert sumArr == 150 : "for-each array sum assertion failed: " + sumArr;

        // Test iteration order
        StringBuilder orderCheck = new StringBuilder();
        for (int n : numbers) {
            orderCheck.append(n).append(",");
        }
        assert orderCheck.toString().equals("10,20,30,40,50,") : "for-each order assertion failed: " + orderCheck;

        // Test for-each with String (Java for-each doesn't directly iterate over String chars)
        // Java equivalent: String to char array
        String text = "ABC";
        StringBuilder charResult = new StringBuilder();
        for (char ch : text.toCharArray()) {
            charResult.append(ch);
        }
        assert charResult.toString().equals("ABC") : "for-each string assertion failed: " + charResult;

        // Test for-each with break
        int breakSum = 0;
        for (int val : numbers) {
            if (val >= 30) {
                break;
            }
            breakSum += val;
        }
        assert breakSum == 30 : "for-each break assertion failed: " + breakSum;

        System.out.println("verified");
    }
}
