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

// arktsid: eval_binding_identifier_arrow
// description: The `eval` token may be used as a single arrow parameter binding identifier in ArkTS (JS non-strict
// allows `eval => eval`): `(eval) => eval`

function main(): void {
    let af = (eval: int): int => eval;
    arktest.assertEQ(af(1), 1);
}