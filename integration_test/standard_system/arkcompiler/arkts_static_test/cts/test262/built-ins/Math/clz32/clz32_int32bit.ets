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
// arktsid: math_clz32_int32bit
// description: Math.clz32 ToUint32 wrapping for powers of two boundaries

function main(): void {
    arktest.assertEQ(Math.clz32(4294967295), 0, '2**32-1');
    arktest.assertEQ(Math.clz32(4294967296), 32, '2**32');
    arktest.assertEQ(Math.clz32(4294967297), 31, '2**32+1');
    arktest.assertEQ(Math.clz32(65535), 16, '2**16-1');
    arktest.assertEQ(Math.clz32(65536), 15, '2**16');
    arktest.assertEQ(Math.clz32(65537), 15, '2**16+1');
    arktest.assertEQ(Math.clz32(255), 24, '2**8-1');
    arktest.assertEQ(Math.clz32(256), 23, '2**8');
    arktest.assertEQ(Math.clz32(257), 23, '2**8+1');
    arktest.assertEQ(Math.clz32(-4294967295), 31, '-(2**32-1)');
    arktest.assertEQ(Math.clz32(-4294967296), 32, '-(2**32)');
    arktest.assertEQ(Math.clz32(-4294967297), 0, '-(2**32+1)');
    arktest.assertEQ(Math.clz32(-65535), 0, '-(2**16-1)');
    arktest.assertEQ(Math.clz32(-65536), 0, '-(2**16)');
    arktest.assertEQ(Math.clz32(-65537), 0, '-(2**16+1)');
    arktest.assertEQ(Math.clz32(-255), 0, '-(2**8-1)');
    arktest.assertEQ(Math.clz32(-256), 0, '-(2**8)');
    arktest.assertEQ(Math.clz32(-257), 0, '-(2**8+1)');
}