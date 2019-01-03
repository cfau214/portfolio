package edu.ccsu.cs417.visitor;

/**
 * Provides an interface for an object to be visited by a SensorVisitor
 */
public interface VisitableSensor
{
    /**
     * Accepts a SensorVisitor that will perform some operation on this object
     *
     * @param visitor the SensorVisitor visiting this object
     */
    void accept(SensorVisitor visitor);
}
