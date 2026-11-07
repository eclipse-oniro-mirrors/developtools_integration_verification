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
struct RoutingComponent140 {
  build() {
    Column({ space: 20 }) {
      Text('命名路由加载测试')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
      
      Text('SUB_ACE_UI_COMPONENT_ROTING__0140')
        .fontSize(16)
        .fontColor(Color.Gray)
      
      Divider()
      
      Text('测试场景：')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
      
      Text('loadContentByName中name为number')
        .fontSize(14)
        .margin({ top: 10 })
      
      Text('预期结果：')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .margin({ top: 20 })
      
      Text('编译报错')
        .fontSize(14)
        .fontColor(Color.Red)
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Start)
  }
}

