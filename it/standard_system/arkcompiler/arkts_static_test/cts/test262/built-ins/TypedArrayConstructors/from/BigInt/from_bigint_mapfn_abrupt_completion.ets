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

// arktsid: from_bigint_mapfn_abrupt_completion
// description: BigInt64Array.from propagates abrupt completion from mapfn

function main(): void {
    let src: bigint[] = [42n, 43n];
    let threw: boolean = false;
    try {
        BigInt64Array.from(src, (v: BigInt, k: number): BigInt => {
            throw new Error('mapfn abrupt completion');
        });
    } catch (e) {
        threw = true;
    }
    arktest.assertTrue(threw, 'from propagates mapfn abrupt completion');
}