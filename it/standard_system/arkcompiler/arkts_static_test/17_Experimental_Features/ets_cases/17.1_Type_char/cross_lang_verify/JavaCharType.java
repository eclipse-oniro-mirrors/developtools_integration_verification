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
 * Java verification for ArkTS 17.1 Type char features
 * Compares Java char behavior with ArkTS char behavior
 *
 * @since 2025
 */
public class JavaCharType {
    // Java: char is a primitive 16-bit unsigned integral type
    // ArkTS: char is a class type, subtype of Object

    public static void main(String[] args) {
        // Basic declaration (both languages support this syntax conceptually)
        char a = 'a';
        char z = 'Z';
        System.out.println("char a = " + a + " (value: " + (int) a + ")");

        // Java: char can widen to int (ArkTS: NOT allowed)
        int aInt = a;  // widening, OK in Java
        System.out.println("char->int widening: " + aInt);

        // Java: char is a primitive, assign to Object requires boxing
        Object o = a;  // auto-boxing to Character
        System.out.println("char->Object (auto-boxed): " + o);

        // Java: char can do arithmetic (ArkTS: NOT allowed)
        char next = (char) (a + 1);  // OK in Java, needs cast back
        System.out.println("a + 1 = " + (int) next + " ('" + next + "')");

        // Java: int->char requires explicit cast (both languages agree)
        char cFromInt = (char) 65;
        System.out.println("(char)65 = '" + cFromInt + "'");

        System.out.println("=== All Java char type tests passed ===");
    }
}
