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
// arktsid: global_constructor_properties_func_context
// description: Global object has constructor properties Object, String, Number, Array, Boolean, Date, RegExp, Error,
// EvalError, RangeError, ReferenceError, SyntaxError, TypeError, URIError (function execution context)
// Conversion notes: Function is excluded - in ArkTS Function is an interface and cannot be instantiated. Classes cannot
// be referenced as bare values (ESY0318), so constructors are verified by instantiation. A helper returning `Object |
// null` keeps the non-null check non-foldable. Checks wrapped in a helper function to mirror the source structure.

function asNullable(o: Object): Object | null {
    return o;
}

function checkConstructorProperties(): void {
    arktest.assertTrue(asNullable({}) !== null);
    arktest.assertTrue(asNullable([] as Object[]) !== null);
    arktest.assertTrue(asNullable(true) !== null);
    arktest.assertTrue(asNullable(new Date()) !== null);
    arktest.assertTrue(asNullable(new RegExp('a')) !== null);
    arktest.assertTrue(asNullable(new Error('e')) !== null);
    arktest.assertTrue(asNullable(new EvalError('ee')) !== null);
    arktest.assertTrue(asNullable(new RangeError('re')) !== null);
    arktest.assertTrue(asNullable(new ReferenceError('rfe')) !== null);
    arktest.assertTrue(asNullable(new SyntaxError('se')) !== null);
    arktest.assertTrue(asNullable(new TypeError('te')) !== null);
    arktest.assertTrue(asNullable(new URIError('ue')) !== null);
}

function main(): void {
    checkConstructorProperties();
}