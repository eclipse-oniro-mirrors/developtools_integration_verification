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
struct MediaBadgeLargeFont {
  @State counterEnabled: boolean = true;

  build() {
    Column() {
      Badge({
        count: 5,  // 数字角标
        position: BadgePosition.RightTop, // 位置（右上角）
        style: {
          badgeColor: Color.Red, // 背景色
        }
      }) {
        Text('消息') // 主内容
          .fontSize(20)
          .padding(10)
      }
      .margin(20)
    }
  }
}
