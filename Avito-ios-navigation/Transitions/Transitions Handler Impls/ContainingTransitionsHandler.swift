/// Базовый класс для содержащих обработчиков переходов
public class ContainingTransitionsHandler: TransitionsHandlerContainer, TransitionsCoordinatorHolder, TransitionsHandler {
    // MARK: - TransitionsCoordinatorHolder    
    public let transitionsCoordinator: TransitionsCoordinator
    
    public init(transitionsCoordinator: TransitionsCoordinator)
    {
        self.transitionsCoordinator = transitionsCoordinator
    }

    // MARK: - TransitionsHandlerContainer
    public var allTransitionsHandlers: [AnimatingTransitionsHandler]? {
        return nil
    }
    
    public var visibleTransitionsHandlers: [AnimatingTransitionsHandler]? {
        return nil
    }

    // MARK: - TransitionsHandler
    public func performTransition(context context: ForwardTransitionContext)
    {
        transitionsCoordinator.coordinatePerformingTransition(context: context, forContainingTransitionsHandler: self)
    }
    
    public func undoTransitionsAfter(transitionId transitionId: TransitionId)
    {
        transitionsCoordinator.coordinateUndoingTransitionsAfter(transitionId: transitionId, forContainingTransitionsHandler: self)
    }
    
    public func undoTransitionWith(transitionId transitionId: TransitionId)
    {
        transitionsCoordinator.coordinateUndoingTransitionWith(transitionId: transitionId, forContainingTransitionsHandler: self)
    }
    
    public func undoAllChainedTransitions()
    {
        assert(false, "такой метод нельзя посылать контейнеру обработчиков переходов. только анимирующему обработчику")
    }
    
    public func undoAllTransitions()
    {
        assert(false, "такой метод нельзя посылать контейнеру обработчиков переходов. только анимирующему обработчику")
    }
    
    public func resetWithTransition(context context: ForwardTransitionContext)
    {
        assert(false, "такой метод нельзя посылать контейнеру обработчиков переходов. только анимирующему обработчику")
    }
}