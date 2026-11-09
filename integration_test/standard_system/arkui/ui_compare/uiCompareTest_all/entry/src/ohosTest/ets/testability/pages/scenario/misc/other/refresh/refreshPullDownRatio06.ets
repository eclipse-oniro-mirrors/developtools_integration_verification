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
 * 测试用例0180页面
 * Refresh组件默认动态下拉跟手系数测试 - 下拉距离越大，阻力越大
 */
@Entry
@Component
struct RefreshPullDownRatio06 {
  @State isRefreshing: boolean = false;
  @State arr: string[] = ['项目1', '项目2', '项目3', '项目4', '项目5', '项目6', '项目7', '项目8', '项目9', '项目10'];

  build() {
    Column() {
      // 页面标题
      Text('测试用例0180 - 默认动态下拉跟手系数测试')
        .height(50)
        .fontSize(16)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('100%')
        .border({ width: 1 })
        .lineHeight(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 8, bottom: 8 });

      // 状态信息显示
      Text(`默认pullDownRatio: 动态系数, 刷新状态: ${this.isRefreshing ? '刷新中' : '未刷新'}`)
        .height(35)
        .fontSize(12)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('100%')
        .border({ width: 1 })
        .lineHeight(16)
        .fontWeight(300)
        .margin({ bottom: 8 });

      // Refresh测试区域 - 使用默认动态下拉跟手系数
      Refresh({ refreshing: $$this.isRefreshing }) {
        List() {
          ForEach(this.arr, (item: string) => {
            ListItem() {
              Text(item)
                .width('90%')
                .height(80)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
                .borderRadius(10)
                .margin(10)
            }
          }, (item: string) => item)
        }
        .width('100%')
        .height('100%')
        .scrollBar(BarState.Off)
      }
      .width('100%')
      .height('80%')
      .backgroundColor('0xFFE4E1')
      .pullToRefresh(true)
      .refreshOffset(64)
      .onStateChange((refreshStatus: RefreshStatus) => {
        console.info('测试用例0180 Refresh onStateChange:', refreshStatus);
      })
      .onOffsetChange((value: number) => {
        console.info('测试用例0180 Refresh onOffsetChange:', value);
      })
      .onRefreshing(() => {
        console.info('测试用例0180 Refresh onRefreshing triggered');
        setTimeout(() => {
          this.isRefreshing = false;
        }, 2000);
      })

      // 控制按钮区域
      Button('开始刷新')
        .id('refreshPullDownRatio06_01')
        .width('80%')
        .height(40)
        .margin({ top: 10 })
        .onClick(() => {
          this.isRefreshing = true;
        });
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .padding({ left: 12, right: 12, top: 8, bottom: 8 });
  }
}
