/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
@Entry
@Component
struct MbFont0029 {

  build() {
    Column() {
      Badge({
        count: 99,
        style: {
          fontSize:'100%'
        },
        position: BadgePosition.RightTop,
      }) {
        Text('默认提示文本')
          .fontSize('10%')
      }

      Badge({
        count: 99,
        style: {
          fontSize:'10vp'
        },
        position: BadgePosition.RightTop,
      }) {
        Text('对比提示文本')
          .fontSize('16fp')
      }
    }
  }
}
