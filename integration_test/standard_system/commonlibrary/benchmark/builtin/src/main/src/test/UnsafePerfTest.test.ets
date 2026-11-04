/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  describe,
  it,
  TestType,
  Size,
  Level,
  beforeEach,
  afterAll
} from "../../../hypium/index";
import performance from './Performance.util';

const BASE_COUNT = 50000;
const MIX_COUNT = 100;
const UNIT_TIME = 1000000;

function recordPerformance(caseName: string, className: string, apiName: string, signature: string, dTime: long): void {
  recordPerformanceWithCount(caseName, className, apiName, signature, dTime, BASE_COUNT);
}

function recordPerformanceWithCount(caseName: string, className: string, apiName: string, signature: string, dTime: long, count: int): void {
  let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / count;
  console.info('arkTsPerformanceTest arkTsAveragedTime ' + caseName + ': ' + arkTsAveragedTime + 'ns');
  performance.apiWithClassAndKeywordTxt('std.core', className, apiName, signature, arkTsAveragedTime);
}

function toByteValue(value: int): byte {
  return value.toByte();
}

function toShortValue(value: int): short {
  return value.toShort();
}

function toLongValue(value: int): long {
  return value.toLong();
}

function toFloatValue(value: double): float {
  return value.toFloat();
}

function createTestStringObject(): String {
  return new String("test string");
}

function createTestStringPrimitive(): string {
  return "test string";
}

function getUnsafeTestAddress(): long {
  return new Long();
}

export default function UnsafePerfTest(): void {
  describe('UnsafePerfTest', () => {
    beforeEach(() => {
      let ret = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret);
      let ret1 = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret1);
    });

    afterAll(() => {
      performance.save('apiPerformance.txt');
    });


    it('PerformanceTest_unsafeMemory_writeInt8_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let address = getUnsafeTestAddress();
        let value: byte = toByteValue(127);
        unsafeMemory.writeInt8(address, value);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          unsafeMemory.writeInt8(address, value);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = address;
        recordPerformance('PerformanceTest_unsafeMemory_writeInt8_0100', 'unsafeMemory', 'writeInt8',
          'writeInt8(address: long, value: byte): void', Dtime);
      });

    it('PerformanceTest_unsafeMemory_writeBoolean_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let address = getUnsafeTestAddress();
        let value: boolean = true;
        unsafeMemory.writeBoolean(address, value);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          unsafeMemory.writeBoolean(address, value);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = address;
        recordPerformance('PerformanceTest_unsafeMemory_writeBoolean_0100', 'unsafeMemory', 'writeBoolean',
          'writeBoolean(address: long, value: boolean): void', Dtime);
      });

    it('PerformanceTest_unsafeMemory_writeInt16_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let address = getUnsafeTestAddress();
        let value: short = toShortValue(32767);
        unsafeMemory.writeInt16(address, value);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          unsafeMemory.writeInt16(address, value);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = address;
        recordPerformance('PerformanceTest_unsafeMemory_writeInt16_0100', 'unsafeMemory', 'writeInt16',
          'writeInt16(address: long, value: short): void', Dtime);
      });

    it('PerformanceTest_unsafeMemory_writeInt32_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let address = getUnsafeTestAddress();
        let value: int = 2147483647;
        unsafeMemory.writeInt32(address, value);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          unsafeMemory.writeInt32(address, value);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = address;
        recordPerformance('PerformanceTest_unsafeMemory_writeInt32_0100', 'unsafeMemory', 'writeInt32',
          'writeInt32(address: long, value: int): void', Dtime);
      });

    it('PerformanceTest_unsafeMemory_writeFloat32_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let address = getUnsafeTestAddress();
        let value: float = toFloatValue(3.14159);
        unsafeMemory.writeFloat32(address, value);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          unsafeMemory.writeFloat32(address, value);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = address;
        recordPerformance('PerformanceTest_unsafeMemory_writeFloat32_0100', 'unsafeMemory', 'writeFloat32',
          'writeFloat32(address: long, value: float): void', Dtime);
      });

    it('PerformanceTest_unsafeMemory_writeInt64_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let address = getUnsafeTestAddress();
        let value: long = toLongValue(123456789);
        unsafeMemory.writeInt64(address, value);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          unsafeMemory.writeInt64(address, value);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = address;
        recordPerformance('PerformanceTest_unsafeMemory_writeInt64_0100', 'unsafeMemory', 'writeInt64',
          'writeInt64(address: long, value: long): void', Dtime);
      });

    it('PerformanceTest_unsafeMemory_writeFloat64_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let address = getUnsafeTestAddress();
        let value: double = 3.141592653589793;
        unsafeMemory.writeFloat64(address, value);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          unsafeMemory.writeFloat64(address, value);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = address;
        recordPerformance('PerformanceTest_unsafeMemory_writeFloat64_0100', 'unsafeMemory', 'writeFloat64',
          'writeFloat64(address: long, value: double): void', Dtime);
      });

    it('PerformanceTest_unsafeMemory_writeNumber_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let address = getUnsafeTestAddress();
        let value: number = 12345.6789;
        unsafeMemory.writeNumber(address, value);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          unsafeMemory.writeNumber(address, value);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = address;
        recordPerformance('PerformanceTest_unsafeMemory_writeNumber_0100', 'unsafeMemory', 'writeNumber',
          'writeNumber(address: long, value: number): void', Dtime);
      });

    it('PerformanceTest_unsafeMemory_writeString_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let address = getUnsafeTestAddress();
        let value: String = createTestStringObject();
        let result: int = unsafeMemory.writeString(address, value);
        let Stime = new Date().getTime();

        for (let i = 0; i < MIX_COUNT; i++) {
          result = unsafeMemory.writeString(address, value);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        recordPerformanceWithCount('PerformanceTest_unsafeMemory_writeString_0100', 'unsafeMemory', 'writeString',
          'writeString(address: long, value: String): int', Dtime, MIX_COUNT);
      });

    it('PerformanceTest_unsafeMemory_readInt8_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let address = getUnsafeTestAddress();
        let seed: byte = toByteValue(127);
        unsafeMemory.writeInt8(address, seed);
        let result: byte = unsafeMemory.readInt8(address);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = unsafeMemory.readInt8(address);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        recordPerformance('PerformanceTest_unsafeMemory_readInt8_0100', 'unsafeMemory', 'readInt8',
          'readInt8(address: long): byte', Dtime);
      });

    it('PerformanceTest_unsafeMemory_readBoolean_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let address = getUnsafeTestAddress();
        unsafeMemory.writeBoolean(address, true);
        let result: boolean = unsafeMemory.readBoolean(address);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = unsafeMemory.readBoolean(address);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        recordPerformance('PerformanceTest_unsafeMemory_readBoolean_0100', 'unsafeMemory', 'readBoolean',
          'readBoolean(address: long): boolean', Dtime);
      });

    it('PerformanceTest_unsafeMemory_readInt16_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let address = getUnsafeTestAddress();
        let seed: short = toShortValue(32767);
        unsafeMemory.writeInt16(address, seed);
        let result: short = unsafeMemory.readInt16(address);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = unsafeMemory.readInt16(address);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        recordPerformance('PerformanceTest_unsafeMemory_readInt16_0100', 'unsafeMemory', 'readInt16',
          'readInt16(address: long): short', Dtime);
      });

    it('PerformanceTest_unsafeMemory_readInt32_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let address = getUnsafeTestAddress();
        let seed: int = 2147483647;
        unsafeMemory.writeInt32(address, seed);
        let result: int = unsafeMemory.readInt32(address);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = unsafeMemory.readInt32(address);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        recordPerformance('PerformanceTest_unsafeMemory_readInt32_0100', 'unsafeMemory', 'readInt32',
          'readInt32(address: long): int', Dtime);
      });

    it('PerformanceTest_unsafeMemory_readInt64_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let address = getUnsafeTestAddress();
        let seed: long = toLongValue(123456789);
        unsafeMemory.writeInt64(address, seed);
        let result: long = unsafeMemory.readInt64(address);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = unsafeMemory.readInt64(address);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        recordPerformance('PerformanceTest_unsafeMemory_readInt64_0100', 'unsafeMemory', 'readInt64',
          'readInt64(address: long): long', Dtime);
      });

    it('PerformanceTest_unsafeMemory_readFloat32_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let address = getUnsafeTestAddress();
        let seed: float = toFloatValue(3.14159);
        unsafeMemory.writeFloat32(address, seed);
        let result: float = unsafeMemory.readFloat32(address);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = unsafeMemory.readFloat32(address);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        recordPerformance('PerformanceTest_unsafeMemory_readFloat32_0100', 'unsafeMemory', 'readFloat32',
          'readFloat32(address: long): float', Dtime);
      });

    it('PerformanceTest_unsafeMemory_readFloat64_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let address = getUnsafeTestAddress();
        let seed: double = 3.141592653589793;
        unsafeMemory.writeFloat64(address, seed);
        let result: double = unsafeMemory.readFloat64(address);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = unsafeMemory.readFloat64(address);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        recordPerformance('PerformanceTest_unsafeMemory_readFloat64_0100', 'unsafeMemory', 'readFloat64',
          'readFloat64(address: long): double', Dtime);
      });

    it('PerformanceTest_unsafeMemory_readNumber_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let address = getUnsafeTestAddress();
        let seed: number = 12345.6789;
        unsafeMemory.writeNumber(address, seed);
        let result: number = unsafeMemory.readNumber(address);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = unsafeMemory.readNumber(address);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        recordPerformance('PerformanceTest_unsafeMemory_readNumber_0100', 'unsafeMemory', 'readNumber',
          'readNumber(address: long): number', Dtime);
      });

    it('PerformanceTest_unsafeMemory_readString_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let address = getUnsafeTestAddress();
        let seed: String = createTestStringObject();
        let size: int = unsafeMemory.getStringSizeInBytes(createTestStringPrimitive());
        unsafeMemory.writeString(address, seed);
        let result: String = unsafeMemory.readString(address, size);
        let Stime = new Date().getTime();

        for (let i = 0; i < MIX_COUNT; i++) {
          result = unsafeMemory.readString(address, size);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        recordPerformanceWithCount('PerformanceTest_unsafeMemory_readString_0100', 'unsafeMemory', 'readString',
          'readString(address: long, size: int): String', Dtime, MIX_COUNT);
      });

    it('PerformanceTest_unsafeMemory_getStringSizeInBytes_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let value: string = createTestStringPrimitive();
        let result: int = unsafeMemory.getStringSizeInBytes(value);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = unsafeMemory.getStringSizeInBytes(value);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        recordPerformance('PerformanceTest_unsafeMemory_getStringSizeInBytes_0100', 'unsafeMemory', 'getStringSizeInBytes',
          'getStringSizeInBytes(value: string): int', Dtime);
      });

  });

}
