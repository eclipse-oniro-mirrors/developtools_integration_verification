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
// arktsid: global_math_property_func_context
// description: Global object has the Math property (function execution context)
// Conversion notes: Math is a class/namespace in ArkTS and cannot be referenced as a bare value (ESY0318), so its
// existence is verified by invoking a static method. Checks wrapped in a helper function to mirror the source
// structure.
// existence is verified by invoking a static method. Checks wrapped in a helper function to mirror the source
// structure.

function checkMathProperty(): void {
    arktest.assertTrue(Math.abs(-1) === 1);
    arktest.assertTrue(Math.max(2, 3) === 3);
}

function main(): void {
    checkMathProperty();
}