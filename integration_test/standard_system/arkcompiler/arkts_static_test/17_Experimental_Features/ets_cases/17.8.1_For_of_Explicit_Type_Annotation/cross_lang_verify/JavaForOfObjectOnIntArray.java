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
 * Case: Object explicit type on int[] -- compile and run (autoboxing, PASS)
 *
 * @since 2025
 */
public class JavaForOfObjectOnIntArray {
    public static void main(String[] args) {
        int[] arr = {100, 200, 300};
        int sum = 0;
        for (Object obj : arr) {
            if (obj instanceof Integer) {
                sum++;
            }
        }
        if (sum != 3) {
            throw new AssertionError("assertion failed: expected 3 Integer instances but got " + sum);
        }
        System.out.println("verified");
    }
}
