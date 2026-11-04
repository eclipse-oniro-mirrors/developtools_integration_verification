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
 * Java equivalent of ArkTS 17.10.1 Native Functions tests.
 * Java uses the `native` keyword (JNI - Java Native Interface) with similar semantics.
 *
 * @since 2025
 */
public class NativeFunctionTest {
    // PASS: native method declaration (no body)
    native int getValue();
    native String getName();
    native void setValue(int v);

    // Load native library (for JNI) — in real JNI, you'd load: System.loadLibrary("nativeLib")
    // For test purposes, we skip loading since we only verify declaration
    // Java rejects native+body (matches ArkTS ESE0083) and native+abstract (matches ESE0047)

    // PASS: static native method
    static native double sqrt(double x);

    public int regularMethod() {
        return 42;
    }

    public static void main(String[] args) {
        NativeFunctionTest obj = new NativeFunctionTest();
        // Only test regular method (native methods would need JNI implementation)
        int result = obj.regularMethod();
        assert result == 42 : "Expected 42 but got " + result;
        System.out.println("Java native function declarations compile OK");
        System.out.println("regularMethod returned: " + result);
    }
}
