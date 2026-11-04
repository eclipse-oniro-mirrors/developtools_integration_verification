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
 * Java equivalent for ArkTS 17.15 Accessor Declarations
 * Java does NOT support top-level getter/setter declarations.
 * Java accessors are only available as class-level getter/setter methods
 * (JavaBean convention), not as language-level property accessors.
 *
 * Key difference: ArkTS getter/setter are first-class language constructs
 * usable at top level and in namespaces. Java uses method-based convention.
 *
 * @since 2025
 */
public class JavaAccessorDeclaration {
    // JavaBean-style: backing field + getter/setter methods
    private static int backingValue = 0;

    // ArkTS getter:  get value(): int { return backingValue }
    // Java equivalent: explicit getter method
    public static int getValue() {
        return backingValue;
    }

    // ArkTS setter:  set value(v: int) { backingValue = v }
    // Java equivalent: explicit setter method
    public static void setValue(int v) {
        backingValue = v;
    }

    public static void main(String[] args) {
        // ArkTS: value = 42; let x: int = value
        // Java: setValue(42); int x = getValue()
        setValue(42);
        int result = getValue();
        if (result != 42) {
            throw new AssertionError("assertion failed: expected 42, got " + result);
        }
        System.out.println("Java: getter/setter via methods = " + result);

        setValue(20);
        if (getValue() != 20) {
            throw new AssertionError("assertion failed");
        }
        setValue(getValue() + 5);
        if (getValue() != 25) {
            throw new AssertionError("assertion failed");
        }
        System.out.println("Java: getter+setter interaction correct, final=" + getValue());

        System.out.println("Note: Java has NO top-level getter/setter declarations.");
        System.out.println("Java uses explicit getXxx()/setXxx() method convention instead.");
        System.out.println("ArkTS getter/setter are used like variables (value = x, console.log(value)),");
        System.out.println("which is more similar to Swift computed properties.");
    }
}
