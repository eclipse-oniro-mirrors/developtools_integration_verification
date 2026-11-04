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

// arktsid: promise_is_constructor
// description: Promise is a constructor — new Promise() creates a Promise instance

function main(): void {
    // Promise can be constructed with new
    let p: Promise<int> = new Promise<int>((resolve: (v: int) => void, _reject: (e: Error) => void): void => {
        resolve(42);
    });
    arktest.assertNE(p, null, 'new Promise() creates a non-null Promise instance');
}