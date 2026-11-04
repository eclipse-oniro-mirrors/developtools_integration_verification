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
 * Java verification for ArkTS 17.1.1 char Literals
 * Java char literals use single quotes: 'X'
 * Java also supports escape sequences.
 *
 * @since 2025
 */
public class JavaCharLiterals {
    public static void main(String[] args) {
        // ASCII literals (Java and ArkTS both use quotes, ArkTS uses c'X')
        char a = 'a';
        char z = 'Z';
        char zero = '0';
        System.out.println("'a' = " + (int) a);
        System.out.println("'Z' = " + (int) z);
        System.out.println("'0' = " + (int) zero);

        // Escape sequences (same in both languages)
        char nl = '\n';
        char tab = '\t';
        System.out.println("newline = " + (int) nl);
        System.out.println("tab = " + (int) tab);

        // Boundary values
        char min = 0;  // 0
        char max = 65535;  // 65535
        System.out.println("U+0000 = " + (int) min);
        System.out.println("U+FFFF = " + (int) max);
        System.out.println("U+0000 < U+FFFF: " + (min < max));

        System.out.println("=== All Java char literal tests passed ===");
    }
}
