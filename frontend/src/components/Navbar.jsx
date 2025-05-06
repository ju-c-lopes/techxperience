import { useState } from "react";
import ThemeToggle from "./ThemeToggle";
import useTheme from "../layout/useTheme";

function Navbar() {
    const [isOpen, setIsOpen] = useState(false);
    const logoDark = useTheme() === "dark" ? "./src/assets/img/techxperience-light.png" :"./src/assets/img/techxperience.png";

    return (
        <nav className="bg-white dark:bg-gray-900 border-b border-gray-200 dark:border-gray-700">
            <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div className="flex justify-between h-16">
                    <div className="flex items-center">
                        <button
                            onClick={() => setIsOpen(!isOpen)}
                            className="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-white hover:bg-gray-700 focus:outline-none md:hidden"
                        >
                            <svg
                                className="h-6 w-6"
                                stroke="currentColor"
                                fill="none"
                                viewBox="0 0 24 24"
                            >
                                {isOpen ? (
                                    <path
                                        strokeLinecap="round"
                                        strokeLinejoin="round"
                                        strokeWidth="2"
                                        d="M6 18L18 6M6 6l12 12"
                                    />
                                ) : (
                                    <path
                                        strokeLinecap="round"
                                        strokeLinejoin="round"
                                        strokeWidth="2"
                                        d="M4 6h16M4 12h16M4 18h16"
                                    />
                                )}
                            </svg>
                        </button>
                        <div className="hidden md:flex md:ml-6">
                            <a
                                href="/"
                                className="px-3 py-2 rounded-md text-sm font-medium text-gray-700 dark:text-gray-300 hover:text-white hover:bg-gray-700"
                            >
                                Início
                            </a>
                            <a
                                href="/"
                                className="ml-4 px-3 py-2 rounded-md text-sm font-medium text-gray-700 dark:text-gray-300 hover:text-white hover:bg-gray-700"
                            >
                                Sobre
                            </a>
                            <a
                                href="/"
                                className="ml-4 px-3 py-2 rounded-md text-sm font-medium text-gray-700 dark:text-gray-300 hover:text-white hover:bg-gray-700"
                            >
                                Contato
                            </a>
                        </div>
                    </div>
                    <div className="flex">
                        <a
                            href="/"
                            className="flex-shrink-0 flex items-center text-xl font-bold"
                        >
                            <img width="150" height="auto" src={logoDark} alt="TechXperience Logo" />
                        </a>
                    </div>
                    <ThemeToggle />
                </div>
            </div>
            {isOpen && (
                <div className="md:hidden">
                    <a
                        href="/"
                        className="block px-4 py-2 text-sm text-gray-700 dark:text-gray-300 hover:bg-gray-700"
                    >
                        Início
                    </a>
                    <a
                        href="/"
                        className="block px-4 py-2 text-sm text-gray-700 dark:text-gray-300 hover:bg-gray-700"
                    >
                        Sobre
                    </a>
                    <a
                        href="/"
                        className="block px-4 py-2 text-sm text-gray-700 dark:text-gray-300 hover:bg-gray-700"
                    >
                        Contato
                    </a>
                </div>
            )}
        </nav>
    );
}

export default Navbar;
