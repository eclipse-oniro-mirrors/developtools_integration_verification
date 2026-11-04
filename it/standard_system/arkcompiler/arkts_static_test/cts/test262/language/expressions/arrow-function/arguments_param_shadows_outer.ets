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

// arktsid: arguments_param_shadows_outer
// description: A non-strict JS formal parameter named `arguments` overrides the arguments binding; the arrow
// `(arguments) => arguments` returned from an outer function yields the passed value, `f()(2)` -> 2

function makeId(): (x: int) => int {
    return (arguments: int): int => arguments;
}

function main(): void {
    arktest.assertEQ(makeId()(2), 2);
}