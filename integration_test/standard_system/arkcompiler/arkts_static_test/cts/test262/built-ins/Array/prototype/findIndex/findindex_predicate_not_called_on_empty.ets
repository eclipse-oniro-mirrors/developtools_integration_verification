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

// arktsid: findindex_predicate_not_called_on_empty
// description: Predicate is only called if this.length is > 0

function main(): void {
    let called: boolean = false;
    let arr: string[] = [];
    let r: int = arr.findIndex((_val: string): boolean => {
        called = true;
        return true;
    });
    arktest.assertTrue(called === false, 'predicate not called on empty array');
    arktest.assertEQ(r, -1, 'findIndex on empty returns -1');
}