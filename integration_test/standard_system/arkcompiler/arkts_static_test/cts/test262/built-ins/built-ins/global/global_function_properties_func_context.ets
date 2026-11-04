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
// arktsid: global_function_properties_func_context
// description: Global object has function properties parseInt, parseFloat, isNaN, isFinite, decodeURI,
// decodeURIComponent, encodeURI, encodeURIComponent (function execution context)
// Conversion notes: eval is not available in ArkTS (forbidden) and is excluded. Overloaded functions
// (parseInt/isNaN/isFinite) are verified by invocation since they cannot be referenced as bare values. Checks
// wrapped in
// (parseInt/isNaN/isFinite) are verified by invocation since they cannot be referenced as bare values. Checks
// wrapped in
// a helper function to mirror the source structure.

function checkFunctionProperties(): void {
    arktest.assertTrue(parseInt('10', 10) === 10);
    arktest.assertTrue(parseFloat('3.5') === 3.5);
    arktest.assertTrue(isNaN(NaN) === true);
    arktest.assertTrue(isFinite(0) === true);
    arktest.assertTrue(decodeURI('%41') === 'A');
    arktest.assertTrue(decodeURIComponent('%41') === 'A');
    arktest.assertTrue(encodeURI('A') === 'A');
    arktest.assertTrue(encodeURIComponent('A') === 'A');
}

function main(): void {
    checkFunctionProperties();
}