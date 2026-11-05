/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
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
// arktsid: substring_applied_to_class_instance_n
// description: String.prototype.substring applied to a class instance is rejected at compile time (generic method
// unavailable)
// description: String.prototype.substring applied to a class instance is rejected at compile time (generic method
// unavailable)
// Conversion notes: test262 __FACTORY instance toString() returns "undefined", substring(0, 100); ArkTS substring
// exists only on String
// Conversion notes: test262 __FACTORY instance toString() returns "undefined", substring(0, 100); ArkTS substring
// exists only on String

/*---
desc: String.prototype.substring applied to a class instance is rejected at compile time (generic method unavailable)
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0087: Property 'substring' does not exist on type 'Factory'"]
---*/

class Factory {
    public value: string;
    constructor(v: string) {
        this.value = v;
    }
    toString(): string {
        return this.value;
    }
}

function main(): void {
    let inst: Factory = new Factory('');
    inst.substring(0, 100);
}
