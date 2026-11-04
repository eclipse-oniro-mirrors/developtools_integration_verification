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

// arktsid: nativeerrors_evalerror_is_constructor
// description: EvalError is a constructor — new EvalError() creates an EvalError instance

function main(): void {
    // EvalError can be constructed with new
    let e: EvalError = new EvalError('test');
    arktest.assertEQ(e.name, 'EvalError', 'new EvalError() creates EvalError with correct name');
    arktest.assertEQ(e.message, 'test', 'new EvalError(\'test\') creates EvalError with correct message');
}