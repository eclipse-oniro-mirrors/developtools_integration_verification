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
// arktsid: global_value_properties_func_context
// description: Global object has value properties NaN, Infinity, undefined (function execution context)
// Conversion notes: ArkTS has no distinct global-vs-function execution context for globals; checks are wrapped in a
// helper function to mirror the source structure. typeof is used for undefined (see global_value_properties.ets).

function checkValueProperties(): void {
    arktest.assertTrue(typeof NaN === 'number');
    arktest.assertTrue(typeof Infinity === 'number');
    arktest.assertTrue(typeof undefined === 'undefined');
}

function main(): void {
    checkValueProperties();
}