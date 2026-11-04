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
// arktsid: decodeuricomponent_basic
// description: decodeURIComponent decodes percent-encoded URI component characters including reserved chars

function main(): void {
    // Basic ASCII
    arktest.assertEQ(decodeURIComponent('%41%42%43'), 'ABC');

    // decodeURIComponent decodes reserved chars that decodeURI leaves encoded
    arktest.assertEQ(decodeURIComponent('%2F%3F%26%3D%23'), '/?&=#');

    // Space
    arktest.assertEQ(decodeURIComponent('hello%20world'), 'hello world');
}