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

// arktsid: yield_default_param_reference
// description: The `yield` token may be used as an IdentifierReference in an arrow default parameter, referencing an
// outer `yield` binding (JS non-strict): `let yield = 23; (x = yield) => x`

function main(): void {
    let yield = 23;
    let f = (x: int = yield): int => x;
    arktest.assertEQ(f(), 23);
}