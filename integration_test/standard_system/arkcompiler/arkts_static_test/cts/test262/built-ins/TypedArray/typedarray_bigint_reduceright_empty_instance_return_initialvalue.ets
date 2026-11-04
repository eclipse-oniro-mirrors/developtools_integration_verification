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

// arktsid: typedarray_bigint_reduceright_empty_instance_return_initialvalue
// description: reduceRight on an empty BigInt typed array with an initial value returns the initial
// Conversion notes: result unboxed to bigint.

function main(): void {
    let taBi64 = new BigInt64Array(0);
    let rBi64: bigint = taBi64.reduceRight((acc: BigInt, v: BigInt): BigInt => acc + v, 42n);
    arktest.assertEQ(rBi64, 42n, 'BigInt64Array empty reduceRight returns initial');
    let taBu64 = new BigUint64Array(0);
    let rBu64: bigint = taBu64.reduceRight((acc: BigInt, v: BigInt): BigInt => acc + v, 42n);
    arktest.assertEQ(rBu64, 42n, 'BigUint64Array empty reduceRight returns initial');
}