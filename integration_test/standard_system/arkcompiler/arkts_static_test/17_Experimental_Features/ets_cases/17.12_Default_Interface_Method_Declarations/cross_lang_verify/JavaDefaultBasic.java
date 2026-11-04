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
 * Java equivalent of ArkTS EXP2_17_12_001 - Default method basic usage
 * Tests: interface with default method, class implements without override
 */
interface IGreeter {
    /**
     * Default greet method
     */
    default void greet() {
        System.out.println("Hello from default method");
    }
}

class Person implements IGreeter {
    String name = "Alice";
}

class JavaDefaultBasic {
    public static void main(String[] args) {
        Person p = new Person();
        p.greet();
        System.out.println("PASS");
    }
}
