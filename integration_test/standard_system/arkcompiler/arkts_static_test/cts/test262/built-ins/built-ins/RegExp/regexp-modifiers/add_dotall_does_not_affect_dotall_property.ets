/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// arktsid: add_dotall_does_not_affect_dotall_property
// description: Adding dotAll (`s`) modifier does not affect RegExp instance `dotAll` property.

function main(): void {
    let re1 = new RegExp('(?s:)', '');
    arktest.assertTrue(!re1.dotAll);

    let re2 = new RegExp('(?s:)', '');
    arktest.assertTrue(!re2.dotAll);

    let re3 = new RegExp('(?s-:)', '');
    arktest.assertTrue(!re3.dotAll);

    let re4 = new RegExp('(?s-:)', '');
    arktest.assertTrue(!re4.dotAll);
}