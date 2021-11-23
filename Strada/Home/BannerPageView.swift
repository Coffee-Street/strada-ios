//
//  BannerPageView.swift
//  Strada
//
//  Created by 박종봉 on 2021/11/22.
//
import UIKit
import SwiftUI

struct BannerPageViewController : UIViewControllerRepresentable {
    var controllers: [UIViewController]
    
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> some UIViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        pageViewController.dataSource = context.coordinator
        
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController) {
        pageViewController.setViewControllers([controllers[currentPage]], direction: .forward, animated: true)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
    
    class Coordinator : NSObject, UIPageViewControllerDataSource {
        var parent: BannerPageViewController
        
        init(_ pageViewController: BannerPageViewController) {
            self.parent = pageViewController
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return parent.controllers.last
            }
            return parent.controllers[index - 1]
        }

        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == parent.controllers.count {
                return parent.controllers.first
            }
            return parent.controllers[index + 1]
        }
    }

}

struct BannerPageControl : UIViewRepresentable {
    
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
}

struct BannerPageView<Page: View> : View {
    var viewControllers: [UIHostingController<Page>]
    
    @State var currentPage: Int = 0
    
    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            BannerPageViewController(controllers: viewControllers, currentPage: $currentPage)
            BannerPageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
        }
    }
}

struct BannerPageView_Previews: PreviewProvider {
    static var previews: some View {
        BannerPageView<Page: BannerItemView>([BannerItemView(symbolName: "cup")])
    }
}
