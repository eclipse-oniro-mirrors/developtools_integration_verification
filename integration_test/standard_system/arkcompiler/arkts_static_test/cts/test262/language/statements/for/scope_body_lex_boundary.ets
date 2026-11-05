/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: scope_body_lex_boundary
// description: Creation of new lexical environment for each evaluation of the statement body

function main(): void {
    let probeFirst: (() => string) | undefined = undefined;
    let probeSecond: (() => string) | null = null;
    for (let x: string = 'first'; probeSecond == null; x = 'second') {
        if (probeFirst == undefined) {
            probeFirst = () => x;
        } else {
            probeSecond = () => x;
        }
    }
    arktest.assertEQ(probeFirst!(), 'first');
    arktest.assertEQ(probeSecond!(), 'second');
}
