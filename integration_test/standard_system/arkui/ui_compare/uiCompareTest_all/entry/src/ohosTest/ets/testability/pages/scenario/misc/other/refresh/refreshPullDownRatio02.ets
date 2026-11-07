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
 * 测试用例0020页面
 * Refresh组件pullDownRatio为0.1测试 - 下拉、上滑时阻力很大，几乎无法滑动
 */
@Entry
@Component
struct RefreshPullDownRatio02 {
  @State isRefreshing: boolean = false;
  @State arr: string[] = ['项目1', '项目2', '项目3', '项目4', '项目5', '项目6', '项目7', '项目8', '项目9', '项目10'];

  build() {
    Column() {
      // 页面标题
      Text('测试用例0020 - pullDownRatio为0.1测试')
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
      Text(`pullDownRatio: 0.1, 刷新状态: ${this.isRefreshing ? '刷新中' : '未刷新'}`)
        .height(35)
        .fontSize(12)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('100%')
        .border({ width: 1 })
        .lineHeight(16)
        .fontWeight(300)
        .margin({ bottom: 8 });

      // Refresh测试区域
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
      .backgroundColor('0xFFFACD')
      .pullToRefresh(true)
      .pullDownRatio(0.1)
      .refreshOffset(64)
      .onStateChange((refreshStatus: RefreshStatus) => {
        console.info('测试用例0020 Refresh onStateChange:', refreshStatus);
      })
      .onOffsetChange((value: number) => {
        console.info('测试用例0020 Refresh onOffsetChange:', value);
      })
      .onRefreshing(() => {
        console.info('测试用例0020 Refresh onRefreshing triggered');
        setTimeout(() => {
          this.isRefreshing = false;
        }, 2000);
      })

      // 控制按钮区域
      Button('开始刷新')
        .id('refreshPullDownRatio02_01')
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
