/*
 * Copyright (c) 2021-2026 Huawei Device Co., Ltd.
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

import DecimalPerfTest from "./DecimalPerfTest.test"
import ArrayListPerfTest from "./ArrayListPerfTest.test"
import BufferPerfTest from "./BufferPerfTest.test"
import DequePerfTest from "./DequePerfTest.test"
import HashMapPerfTest from "./HashMapPerfTest.test"
import HashSetPerfTest from "./HashSetPerfTest.test"
import LightWeightMapPerfTest from "./LightWeightMapPerfTest.test"
import LightWeightSetPerfTest from "./LightWeightSetPerfTest.test"
import LinkedListPerfTest from "./LinkedListPerfTest.test"
import ListPerfTest from "./ListPerfTest.test"
import PlainArrayPerfTest from "./PlainArrayPerfTest.test"
import QueuePerfTest from "./QueuePerfTest.test"
import StackPerfTest from "./StackPerfTest.test"
import StreamPerfTest from "./StreamPerfTest.test"
import ArkTsUtilsPerfTest from "./ArkTsUtilsPerfTest.test"
import JsonPerfTest from "./JsonPerfTest.test"
import ConvertXmlPerfTest from "./ConvertXmlPerfTest.test"
import ProcessPerfTest from "./ProcessPerfTest.test"
import TaskPoolPerfTest from "./TaskPoolPerfTest.test"
import FastBufferPerfTest from "./FastBufferPerfTest.test"

import TreeMapPerfTest from './TreeMapPerfTest.test';
import TreeSetPerfTest from './TreeSetPerfTest.test';
import URLPerfTest from './URLPerfTest.test';
import UriPerfTest from './UriPerfTest.test';
import UtilPerfTest01 from './UtilPerfTest01.test';
import UtilPerfTest02 from './UtilPerfTest02.test';
import VectorPerfTest from './VectorPerfTest.test';
import XmlPerfTest from './XmlPerfTest.test';

export default function testsuite(): void {
  DecimalPerfTest();
  ArrayListPerfTest();
  BufferPerfTest();
  DequePerfTest();
  HashMapPerfTest();
  HashSetPerfTest();
  LightWeightMapPerfTest();
  LightWeightSetPerfTest();
  LinkedListPerfTest();
  ListPerfTest();
  PlainArrayPerfTest();
  QueuePerfTest();
  StackPerfTest();
  StreamPerfTest();
  ArkTsUtilsPerfTest();
  JsonPerfTest();
  ConvertXmlPerfTest();
  ProcessPerfTest();
  TaskPoolPerfTest();
  FastBufferPerfTest();

   TreeMapPerfTest()
   TreeSetPerfTest()
   UriPerfTest()
   URLPerfTest()
   UtilPerfTest01()
   UtilPerfTest02()
   VectorPerfTest()
   XmlPerfTest()
}
