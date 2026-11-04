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

// arktsid: dflt_params_arg_val_undefined
// description: Arrow default parameters are applied when the argument value is undefined (JS passes `undefined`/`void
// 0`; ArkTS omits the args)

function main(): void {
    let callCount: int = 0;
    let ref = (fromLiteral: int = 23, fromExpr: int = 45, fromHole: int = 99): void => {
        arktest.assertEQ(fromLiteral, 23);
        arktest.assertEQ(fromExpr, 45);
        arktest.assertEQ(fromHole, 99);
        callCount++;
    };
    ref();
    arktest.assertEQ(callCount, 1);
}