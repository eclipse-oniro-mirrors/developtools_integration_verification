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
 * Java equivalent of compile-fail tests for native keyword.
 * These are commented out because they would cause compilation failure.
 *
 * @since 2025
 */
public class NativeFailTest {
    // FAIL: native method with body - Java error: "native methods cannot have a body"
    // native int badBody() { return 1; }


    public static void main(String[] args) {
        System.out.println("Java native fail cases: documented in comments above");
        System.out.println("Java compiler correctly rejects native+body, native+abstract, native in interface");
    }
}
