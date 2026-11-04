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

// arktsid: regular_subclassing
// description: subclass Error with message, instance .message/.name
// Conversion notes: 源用 `new CustomError('foo 42')`，依赖默认构造器转发消息参数；ArkTS 派生类默认构造器
// 0 参（ESE0124/ESE0127，2026-08-18 探针实测），须显式 `constructor(msg: string) { super(msg); }` 转发。

class CustomError extends Error {
    constructor(msg: string) {
        super(msg);
    }
}

function main(): void {
    let err: CustomError = new CustomError('foo 42');
    arktest.assertTrue(err.message === 'foo 42');
    arktest.assertTrue(err.name === 'Error');
}
