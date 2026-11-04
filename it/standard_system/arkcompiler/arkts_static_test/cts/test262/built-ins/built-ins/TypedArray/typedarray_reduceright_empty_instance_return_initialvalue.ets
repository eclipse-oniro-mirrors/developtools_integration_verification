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

// arktsid: typedarray_reduceright_empty_instance_return_initialvalue
// description: reduceRight on an empty typed array with an initial value returns the initial value
// Conversion notes: representative TypedArray types unrolled.

function main(): void {
    let taI32 = new Int32Array(0);
    let rI32 = taI32.reduceRight((acc: number, v: number): number => acc + v, 42);
    arktest.assertEQ(rI32, 42, 'Int32Array empty reduceRight returns initial');
    let taU8 = new Uint8Array(0);
    let rU8 = taU8.reduceRight((acc: number, v: number): number => acc + v, 42);
    arktest.assertEQ(rU8, 42, 'Uint8Array empty reduceRight returns initial');
    let taF64 = new Float64Array(0);
    let rF64 = taF64.reduceRight((acc: number, v: number): number => acc + v, 42);
    arktest.assertEQ(rF64, 42, 'Float64Array empty reduceRight returns initial');
}