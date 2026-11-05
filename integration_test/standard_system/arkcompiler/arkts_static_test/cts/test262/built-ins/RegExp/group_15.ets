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

// arktsid: group_15
// description: Execute /<body.*>((.*\n?)*?)<\/body>/i.exec(html) and check lazy quantifier capture group results
// Conversion notes:
//  - Tests lazy quantifier (.*\n?)*? over a multi-line HTML body: full match equals __body,
//    group 1 is the text between '>' and '</body>', group 2 is the last-iteration inner group.

function main(): void {
    let body: String = '';
    body += '<body onXXX="alert(event.type);">\n';
    body += '<p>Kibology for all</p>\n';
    body += '<p>All for Kibology</p>\n';
    body += '</body>';

    let html: String = '';
    html += '<html>\n';
    html += body;
    html += '\n</html>';

    let re: RegExp = new RegExp('<body.*>((.*\\n?)*?)<\\/body>', 'i');
    let executed: RegExpExecArray | null = re.exec(html);

    if (executed != null) {
        arktest.assertEQ(executed.length, 3, 'length');
        arktest.assertEQ(executed.index, 7, 'index');
        arktest.assertEQ(executed.input, html, 'input');
        arktest.assertEQ(executed[0], body, 'group 0');
        arktest.assertEQ(executed[1], '\n<p>Kibology for all</p>\n<p>All for Kibology</p>\n', 'group 1');
        arktest.assertEQ(executed[2], '<p>All for Kibology</p>\n', 'group 2');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}