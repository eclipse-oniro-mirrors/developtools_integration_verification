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
 * Case: String explicit type on String[] -- compile and run (PASS)
 *
 * @since 2025
 */
public class JavaForOfStringExplicitType {
    public static void main(String[] args) {
        String[] arr = {"hello", "world", "arkts"};
        StringBuilder result = new StringBuilder();
        for (String s : arr) {
            result.append(s);
        }
        String expected = "helloworldarkts";
        if (!result.toString().equals(expected)) {
            throw new AssertionError("assertion failed: expected " + expected + " but got " + result);
        }
        System.out.println("verified");
    }
}
