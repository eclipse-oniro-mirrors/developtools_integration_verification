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

// arktsid: group_16
// description: Replace "To sign up click |here|https:www.xxxx.org/subscribe.htm|" using capture-group references $2 and
// $4 in the replacement string
// Conversion notes:
//  - String.replace substitutes the capture-group references in the replacement string: $4 (the URL)
//    and $2 (the text between the pipes) become the anchor's href and text respectively.
//  - The [\x81-\xff] range in the second capture group matches no ASCII input, so it does not
//    affect the result on the given ASCII subject.

function main(): void {
    let r: RegExp = new RegExp('(\\|)([\\w\\x81-\\xff ]*)(\\|)([\\/a-z][\\w:\\/\\.]*\\.[a-z]{3,4})(\\|)', 'ig');
    let replaced: string = 'To sign up click |here|https:www.xxxx.org/subscribe.htm|'.replace(r, '<a href="$4">$2</a>');
    arktest.assertEQ(replaced, 'To sign up click <a href="https:www.xxxx.org/subscribe.htm">here</a>', 'replaced');
}