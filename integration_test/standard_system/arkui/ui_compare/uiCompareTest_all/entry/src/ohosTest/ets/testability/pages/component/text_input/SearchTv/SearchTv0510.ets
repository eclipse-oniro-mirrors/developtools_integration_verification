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

/**
 * 测试用例：SUB_ACE_UI_COMPONENT_SEARCH_TV_0510
 * 测试目的：验证搜索框在页面底部时，弹出输入法的避让效果
 * 预期结果：输入法弹出时，搜索框和光标在屏幕中同时显示
 */

@Entry
@ComponentV2
export struct SearchTv0510 {
  @Local searchValue: string = '';

  build() {
    // 使用Flex布局，让Search真正固定在页面底部
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.SpaceBetween }) {
      // 顶部标题区域
      Column({ space: 10 }) {
        Text('SUB_ACE_UI_COMPONENT_SEARCH_TV_0510')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)

        Text('测试：搜索框输入法避让')
          .fontSize(14)
          .fontColor(Color.Gray)
      }
      .width('100%')
      .padding(20)

      // 中间内容区域 - 模拟实际页面内容
      Column({ space: 15 }) {
        Text('测试步骤：')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)

        Text('1. 点击底部搜索框获取焦点')
          .fontSize(13)

        Text('2. 观察输入法弹出时的页面布局')
          .fontSize(13)

        Text('3. 确认搜索框和光标同时可见')
          .fontSize(13)

        Divider().margin({ top: 20, bottom: 20 })

        Text('预期结果：')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Green)

        Text('输入法弹出后，搜索框自动上移避让，搜索框和光标在屏幕中同时显示')
          .fontSize(13)
          .fontColor(Color.Green)
      }
      .width('100%')
      .padding(20)

      // 底部搜索框 - 真正放在页面最底部
      Column() {
        Search({ value: this.searchValue, placeholder: '点击这里弹出输入法测试避让效果...' })
          .id('searchInput')
          .width('100%')
          .height(50)
          .searchButton('搜索')
          .onChange((value: string) => {
            this.searchValue = value;
          })
      }
      .width('100%')
      .padding({ left: 20, right: 20, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
