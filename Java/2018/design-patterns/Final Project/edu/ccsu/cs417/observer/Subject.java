package edu.ccsu.cs417.observer;

import edu.ccsu.cs417.composite.Component;
import edu.ccsu.cs417.composite.Composite;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @author Nicholas Daddona
 * <p>
 * Provides an interface to allow an object to have the functionality of a Subject within the Observer pattern.
 */
public abstract class Subject implements Component
{
    /**
     * A Collection of the Observers watching this Subject
     */
    protected List<Observer> observerList;

    /**
     * Default Constructor
     */
    public Subject()
    {
        observerList = new ArrayList<>();
    }

    /**
     * Attaches an Observer to this Subject
     *
     * @param newObserver the Observer that will be obsering this subject
     */
    public void attachObserver(Observer newObserver)
    {
        observerList.add(newObserver);
    }

    /**
     * Removes the specified Observer from watching this subject
     *
     * @param target the Observer that will no longer be observing this Subject
     */
    public void removeObserver(Observer target)
    {
        observerList.remove(target);
    }

    /**
     * Notifies all Observers of this Subject that a state change occurred
     */
    public void updateObservers()
    {
        for (Observer obs : observerList) {
            obs.update();
        }
    }

    /**
     * Perform a check to see if the Subject's state has changed
     */
    public abstract void checkState();

    /**
     * Returns a hash code value for this Subject for use in hash tables
     *
     * @return a hash code value
     */
    @Override
    public int hashCode()
    {
        int result = 0;
        for (Observer obs : observerList) {
            result += obs.hashCode();
        }
        return result;
    }

    /**
     * Tests if this Subject is equal to an object
     *
     * @param obj the object this object is being compared to
     * @return true if the objects are equal, false otherwise
     */
    public boolean equals(Object obj)
    {
        if (obj == null) { // false if passed object is null
            return false;
        }
        if (this == obj) { // true if obj is this object
            return true;
        }
        if (obj instanceof Subject) {
            boolean status = true;
            Iterator<Observer> otherObservers = ((Subject) obj).observerList.iterator();
            Iterator<Observer> ourObservers = observerList.iterator();
            while (otherObservers.hasNext() && ourObservers.hasNext() && status) {
                status = otherObservers.next().equals(ourObservers.next());
            }
            return status;
        }
        return false;
    }

    /**
     * Returns a String representation of this Subject including its observers
     *
     * @return a String represenation of this Subject
     */
    @Override
    public String toString()
    {
        StringBuilder sb = new StringBuilder();
        for (Observer obs : observerList) { // add a string representation of each observer followed by newline
            sb.append(obs.toString()).append('\n');
        }
        return sb.toString();
    }

    /**
     * Performs an operation on a Component or all Components if this object is a composite
     */
    @Override
    public void operation()
    {
        checkState();
    }

    /**
     * Returns a Composite reference if this Component is a Composite
     *
     * @return a Composite reference if this object is a Composite, null otherwise
     */
    @Override
    public Composite getComposite()
    {
        return null;
    }
}
