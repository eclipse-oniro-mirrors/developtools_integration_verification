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
// arktsid: nativeerrors_evalerror_name
// description: EvalError instances have name "EvalError" and inherit from Error
// Conversion notes: test262 uses verifyProperty(EvalError.prototype, "name", ...) which requires prototype access and
// property descriptors (unsupported); migrated via instance access new EvalError().name.

function main(): void {
    let e = new EvalError('msg');
    arktest.assertEQ(e.name, 'EvalError', 'name');
    arktest.assertEQ(e.message, 'msg', 'message');
    arktest.assertTrue(e instanceof Error, 'instanceof Error');
    arktest.assertTrue(e instanceof EvalError, 'instanceof EvalError');
}