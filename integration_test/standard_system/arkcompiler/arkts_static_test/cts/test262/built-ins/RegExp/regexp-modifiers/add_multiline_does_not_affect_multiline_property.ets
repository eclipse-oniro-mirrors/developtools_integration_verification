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
// arktsid: add_multiline_does_not_affect_multiline_property
// description: Adding multiline (`m`) modifier does not affect RegExp instance `multiline` property.

function main(): void {
    let re1: RegExp = new RegExp('(?m:)');
    arktest.assertTrue(!re1.multiline, 'RegExp instance multiline flag should not be set');

    let re2: RegExp = new RegExp('(?m:)');
    arktest.assertTrue(!re2.multiline, 'RegExp instance multiline flag should not be set');

    let re3: RegExp = new RegExp('(?m-:)');
    arktest.assertTrue(!re3.multiline, 'RegExp instance multiline flag should not be set');

    let re4: RegExp = new RegExp('(?m-:)');
    arktest.assertTrue(!re4.multiline, 'RegExp instance multiline flag should not be set');
}