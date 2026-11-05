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
 * Java equivalent of ArkTS for-of with explicit type annotation (§17.8.1)
 * Case: int explicit type on int[] -- compile and run (PASS)
 *
 * Java's enhanced for-loop always requires explicit type, so this is the baseline.
 *
 * @since 2025
 */
public class JavaForOfIntExplicitType {
    public static void main(String[] args) {
        int[] arr = {10, 20, 30, 40, 50};
        int[] expected = {10, 20, 30, 40, 50};
        int idx = 0;
        for (int v : arr) {
            if (v != expected[idx]) {
                throw new AssertionError("assertion failed: expected " + expected[idx] + " but got " + v);
            }
            idx++;
        }
        if (idx != 5) {
            throw new AssertionError("assertion failed: expected 5 iterations but got " + idx);
        }
        System.out.println("verified");
    }
}
