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
// arktsid: null_literal
// description: null literal is of type object (historical), equals itself, does not equal undefined

function main(): void {
    arktest.assertEQ(null, null);
    arktest.assertEQ(null == undefined, true);
    arktest.assertEQ(null === undefined, false);
    arktest.assertEQ(typeof null, 'object');
}