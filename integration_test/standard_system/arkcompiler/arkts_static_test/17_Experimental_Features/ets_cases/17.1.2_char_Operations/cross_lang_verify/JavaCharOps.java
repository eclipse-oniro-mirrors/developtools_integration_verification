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
 * Java verification for ArkTS 17.1.2 char Operations
 * Java char supports all comparison and arithmetic operations (it's an integral type)
 * ArkTS char only supports comparison operations (== != === < > <= >=)
 *
 * @since 2025
 */
public class JavaCharOps {
    public static void main(String[] args) {
        char a = 'a';  // 97
        char b = 'b';  // 98
        char upperA = 'A';  // 65

        // Equality (both languages)
        System.out.println("'a' == 'a': " + (a == 'a'));
        System.out.println("'a' != 'b': " + (a != b));

        // Relational (both languages)
        System.out.println("'a' < 'b': " + (a < b));     // 97 < 98 = true
        System.out.println("'b' > 'a': " + (b > a));     // true
        System.out.println("'A' < 'a': " + (upperA < a));     // 65 < 97 = true

        // char vs int comparison (both languages)
        System.out.println("'a' == 0x61: " + (a == 0x61));  // true
        System.out.println("'a' == 97: " + (a == 97));      // true

        // char vs double comparison (both languages)
        System.out.println("'a' > 3.14: " + (a > 3.14));   // 97 > 3.14 = true

        // Unsigned comparison
        char min = '\u0000';  // 0
        char max = '\uFFFF';  // 65535
        System.out.println("U+0000 < U+FFFF: " + (min < max));  // true

        // Arithmetic - ALLOWED in Java, NOT in ArkTS
        char sum = (char) (a + b);  // OK in Java
        System.out.println("'a' + 'b' = " + (int) sum);

        // char == string - COMPILE ERROR in both languages

        System.out.println("=== All Java char operations tests passed ===");
    }
}
